{
  description = "Template for writing Lecture notes with code inclusion";
  nixConfig.bash-prompt = "\[Template\]$";
  nixConfig.extra-substituters = [
    "https://tweag-jupyter.cachix.org"
  ];
  nixConfig.extra-trusted-public-keys = [
    "tweag-jupyter.cachix.org-1:UtNH4Zs6hVUFpFBTLaA4ejYavPo5EFFqgd7G7FxGW9g="
  ];

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-21.05;
    flake-utils.url = github:numtide/flake-utils;
    flake-compat.url = "github:edolstra/flake-compat";
    flake-compat.flake = false;
    jupyterWith.url = "github:tweag/jupyterWith";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    flake-compat,
    jupyterWith,
  } @ inputs:
    flake-utils.lib.eachDefaultSystem
    (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
        document = import ./document.nix {inherit pkgs texLive;};
        texLive = import ./texlive.nix {
          inherit
            pkgs
            inputs
            system
            ;
        };
      in {
        devShell = import ./shell.nix {inherit pkgs;};
        packages = flake-utils.lib.flattenTree {
          with_output = document.build {
            name = "including_julia_in_latex";
            title = "Lecture_1";
            root_dir = ./without_output;
            root_file = "main.tex";
          };
          without_output = document.build {
            name = "including_julia_in_latex";
            title = "Lecture_1";
            root_dir = ./with_output;
            root_file = "main.tex";
          };
        };
      }
    );
}
