{pkgs ? import <nixpkgs> {}}:
with pkgs; let
  pythonWithPackages = pkgs.python3.withPackages (p:
    with p; [
      ics
    ]);
in
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
