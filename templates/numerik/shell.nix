{pkgs ? import <nixpkgs> {}}:
with pkgs;
  mkShell {
    buildInputs = [
      python38
      julia-lts
      jupyter
    ];
    shellHook = ''
      alias markserv="yarn run markserv"
      export NIXPKGS_ALLOW_INSECURE=1
    '';
  }
