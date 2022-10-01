{pkgs ? import <nixpkgs> {}}:
with pkgs; let
in
  mkShell {
    buildInputs = [
      vscodeKento
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
      export PATH="/home/kento/scriptorium/node_modules/.bin:$PATH"
    '';
  }
