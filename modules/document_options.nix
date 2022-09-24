{lib, options, config, name }: 
let
in
{
  options = {
    documentType = mkOption {
      type = types.enum [ "tex" "html" "nota"];
      default = tex;
    };
    root_dir = mkOption {
      type = types.path;
    };
    
  }
}
