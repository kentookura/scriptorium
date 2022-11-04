source $stdenv/setup
mkdir $out

unset PATH
for p in $buildInputs; do
  export PATH=$p/bin${PATH:+:}$PATH
done

cp -r $src/* $out
cd $out
pdflatex main.tex
