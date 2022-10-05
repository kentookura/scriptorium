{pkgs ? import <nixpkgs> {}}:
with pkgs;
  mkShell {
    buildInputs = [
      python38
      nodejs
      pandoc
      yarn
      yarn2nix
      sass
    ];
    shellHook = ''
      alias markserv="yarn run markserv"
    '';
  }
