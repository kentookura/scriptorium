{
  description = "Scriptorium (/skrɪpˈtɔːriəm/), is commonly used to refer to a room in medieval European monestaries devoted to the writing, copying and illuminating of manuscripts commonly handled by the monastic scribes";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-21.05;
    flake-utils.url = github:numtide/flake-utils;
    documents.url = github:kentookura/latex-flake;
    neovim.url = github:kentookura/neovim;
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    documents,
    neovim,
  } @ inputs: let
    pkgs = import inputs.nixpkgs {
      config.allowUnfree = true;
      system = "x86_64-linux";
      overlays = with inputs; [
        (self: super: {
          neovimKento = neovim.packages."x86_64-linux".neovim;
        })
        (self: super: {
          vscodeKento = with pkgs;
            vscode-with-extensions.override {
              vscode = vscodium;
              vscodeExtensions = with vscode-extensions; [
                james-yu.latex-workshop
                #arrterian.nix-env-selector
                bbenoist.Nix
                jnoortheen.nix-ide
              ];
            };
        })
      ];
    };
  in rec {
    devShells."x86_64-linux".default = import ./shell.nix {inherit pkgs;};
    templates = {
      default = {
        path = ./templates/default;
        description = "Uni Wien Latex Template";
      };
    };
    packages."x86_64-linux".default = documents.packages."x86_64-linux".default;
  };
}
