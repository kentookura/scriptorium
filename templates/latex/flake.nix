{
  description = "LaTeX Document Demo";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-21.05;
    flake-utils.url = github:numtide/flake-utils;
    documents.url = github:kentookura/documents;
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    documents,
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
    devShells.x86_64-linux.default = import ./shell.nix {inherit pkgs;};
    packages.x86_64-linux.default = document.build {
      name = "Nix_LaTeX_Template";
      title = ''My Grand Thesis'';
      author = "Kento Okura";
      root_dir = ./src;
      root_file = "main.tex";
      advisor = "Professor X";
      degree_code = "A 033621";
      date = "Wien, im Monat September 2022";
      field = "Mathematik";
    };
  };
}
