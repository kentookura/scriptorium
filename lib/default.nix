{
  pkgs,
  texDistribution,
}:
with builtins; 
{
  buildTexDocument = config : pkgs.stdenv.mkDerivation {
      src = config.directory;
      name = config.title;
      propagatedBuildInputs = with pkg; [ coreutils texDistribution latexrun ];
      phases = ["unpackPhase" "buildPhase" "installPhase"];
      buildPhase = ''
        echo building ${config.directory}/${config.title}
        mkdir -p ./trash
        latexrun ${config.directory}/${config.root_file} -outdir=./$out -pdf
        rm -r ./trash
      '';
      installPhase = "echo all done";
    };
}
