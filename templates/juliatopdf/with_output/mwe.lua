function executejl(code)
   local tfn = os.tmpname()
   local f = io.open(tfn, 'w')
   assert(f:write(code))
   assert(f:flush())
   f:close()
   local julia = io.popen("julia " .. tfn, "r")
   local s = assert(julia:read('a'))
   julia:close()
   os.remove(tfn)
   local r = string.gsub(s, "\n", "\r")
   return r
end

function popcatcodes()
   local codes = {}
   for c = 0, 255 do
      codes[c] = tex.getcatcode(c)
      tex.setcatcode(c, 12)
   end
   return codes
end

function pushcatcodes(codes)
   for char, code in pairs(codes) do
      tex.setcatcode(char, code)
   end
end

function make_string(arr)
   for i = 1,#arr do
      arr[i] = string.char(arr[i])
   end
   return table.concat(arr)
end

function start_julia(src_listing)
   local stop_tok
   if src_listing then
      stop_tok = "\\end{julia}"
   else
      stop_tok = "\\end{julia*}"
   end
   local code_table = popcatcodes()

   local input = {}
   local tmp = {}
   local stop_cnt = 1
   while stop_cnt <= #stop_tok do
      local c = token.scan_code()
      if c == string.byte(stop_tok, stop_cnt) then
         stop_cnt = stop_cnt + 1
         table.insert(tmp, c)
      else
         table.move(tmp, 1, #tmp, #input + 1, input)
         tmp = {}
         stop_cnt = 1
         table.insert(input, c)
      end
   end
   local s = make_string(input)
   local src = string.gsub(s, "\r", "\n")
   
   pushcatcodes(code_table)

   if src_listing then
      tex.print("\\begin{lstlisting}")
      tex.print(s)
      tex.print("\\end{lstlisting}")
   end
   tex.write(executejl(src))
   tex.sprint(stop_tok)
end
