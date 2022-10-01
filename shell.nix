{pkgs ? import <nixpkgs> {}}:
with pkgs;
  mkShell {
    buildInputs = [
      vscode
      neovimKento
      pandoc
      tex-match
      texlab
      latexrun
      pandoc
      texlive.combined.scheme-full
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
      export NIXPKGS_ALLLOW_UNFREE=1
      export PATH="/home/kento/scriptorium/node_modules/.bin:$PATH"
    '';
  }
