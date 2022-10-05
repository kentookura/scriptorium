{pkgs ? import <nixpkgs> {}}:
with pkgs;
  mkShell {
    buildInputs = [
      texlab
      pandoc
      texlive.combined.scheme-full
    ];
    shellHook = ''
      export PATH="./node_modules/.bin:$PATH"
    '';
  }
