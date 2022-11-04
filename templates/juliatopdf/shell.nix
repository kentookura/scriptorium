{pkgs ? import <nixpkgs> {}}:
with pkgs;
  mkShell {
    buildInputs = [
      texlab
      pandoc
      entr
      (python3.withPackages (ps:
        with ps;
        with python3Packages; [
          jupyter
          ipython
          numpy
          pandas
          pytorch
        ]))
    ];
    shellHook = ''
      export PATH="./node_modules/.bin:$PATH"
    '';
  }
