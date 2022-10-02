{pkgs ? import <nixpkgs> {}}:
with pkgs; let
in
  mkShell {
    buildInputs = [
      pandoc
      texlab
      pandoc
      texlive.combined.scheme-full
      python38
      vscodeKento
      neovimKento
      tex-match
      latexrun
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
