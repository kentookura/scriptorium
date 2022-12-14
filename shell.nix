{
  pkgs ? import <nixpkgs> {},
  config,
}:
with pkgs; let
  pythonWithPackages = pkgs.python3.withPackages (p:
    with p; [
      icalendar
      tox
    ]);
in
  mkShell {
    buildInputs = [
      pandoc
      pythonWithPackages
      yarn
      neovimScriptorium
    ];
    shellHook = ''
      export DIRENV_LOG_FORMAT=
    '';
  }
#texlab
#vscodeKento
#neovimKento
#tex-match
#latexrun
#ghostscript
#nodejs
#yarn
#yarn2nix
#nodePackages.bower
#nodePackages.pnpm
#nodePackages.typescript
#sass
#nodejs

