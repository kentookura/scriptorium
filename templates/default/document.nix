{
  pkgs,
  texLive,
}: {
  build = {
    name,
    title,
    author,
    root_dir,
    root_file,
    advisor,
    degree_code,
    date,
    field,
  }:
    pkgs.stdenvNoCC.mkDerivation {
      src = root_dir;
      name = name;
      pname = name;
      builder = "${pkgs.bash}/bin/bash";
      args = [./pdflatex-builder.sh];
      buildInputs = [pkgs.coreutils pkgs.latexrun texLive.tex pkgs.bash];
      phases = ["buildPhase" "installPhase"];
    };
}
