{pkgs ? import <nixpkgs> {}}:
with pkgs;
  mkShell {
    buildInputs = [
      python38
      julia-bin
      jupyter
    ];
    shellHook = ''
      alias markserv="yarn run markserv"
    '';
  }
