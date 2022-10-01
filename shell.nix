{pkgs ? import <nixpkgs> {}}:
with pkgs;
  mkShell {
    buildInputs = [
      nodejs
      yarn
      yarn2nix
      nodePackages.bower
      nodePackages.pnpm
      nodePackages.typescript
      sass
      nodejs
    ];
    shellHook = ''
      export PATH="/home/kento/scriptorium/node_modules/.bin:$PATH"
    '';
  }
