{
  description = "A cozy place to chill, write some maths and hack around";
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-21.05;
    flake-utils.url = github:numtide/flake-utils;
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }: let
    defineShellCommand = pkgs.writeShellScriptBin;
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    texBuilder = import ./builders/tex.nix pkgs;
    texDistribution = pkgs.texlive.combine {
      inherit
        (pkgs.texlive)
        scheme-basic
        nicematrix
        fontspec
        latexmk
        pgf
        ;
    };
    thesis = {
      title = "Kento_Okura_Thesis";
      root_file = "main.tex";
      directory = ./thesis;
    };
    documents = {
      thesis = texBuilder {
        name = thesis.title;
        src = thesis.directory;
      };
    };
  in 
  rec {
    defaultPackage.x86_64-linux = documents.thesis;
  };
}
