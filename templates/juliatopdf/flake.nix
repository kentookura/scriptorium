{
  description = "LaTeX Document Demo";
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
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    texLive = import ./texlive.nix {
      inherit
        pkgs
        inputs
        system
        ;
    };
    document = import ./document.nix {inherit pkgs texLive;};
  in {
    packages.${system}.document = document.build {
      name = "including_julia_in_latex";
      title = "Lecture_1";
      root_dir = ./src;
      root_file = "main.tex";
    };
    devShells.${system}.default = import ./shell.nix {inherit pkgs;};
  };

  #flake-utils.lib.eachDefaultSystem
  #(
  #  system: let
  #    pkgs = nixpkgs.legacyPackages.${system};
  #  in {
  #    packages.${system}.default = document.build {
  #      name = "including_julia_in_latex";
  #      title = "Lecture_1";
  #      root_dir = ./src;
  #      root_file = "main.tex";
  #    };
  #  }
  #);
}
