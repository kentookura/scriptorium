{
  description = "Scriptorium (/skrɪpˈtɔːriəm/), is commonly used to refer to a room in medieval European monestaries devoted to the writing, copying and illuminating of manuscripts commonly handled by the monastic scribes";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-21.05;
    flake-utils.url = github:numtide/flake-utils;
    documents.url = github:kentookura/latex-flake;
    neovim.url = github:kentookura/neovim;
    doom-emacs.url = github:vlaci/nix-doom-emacs;
    frontend.url = path:/home/kento/scriptorium/frontend;
    home-manager.url = github:nix-community/home-manager;
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    documents,
    neovim,
    doom-emacs,
    frontend,
    home-manager,
  } @ inputs: let
    specialArgs = {
      inherit pkgs neovim doom-emacs;
    };
    pkgs = import inputs.nixpkgs {
      config.allowUnfree = true;
      system = "x86_64-linux";
      overlays = with inputs; [
        (self: super: {
          neovimKento = neovim.packages."x86_64-linux".neovim;
        })
        (self: super: {
          doom-emacs = doom-emacs.packages."x86_64-linux".default;
        })
        (self: super: {
          vscodeKento = with pkgs;
            vscode-with-extensions.override {
              vscode = vscodium;
              vscodeExtensions = with vscode-extensions; [
                james-yu.latex-workshop
                bbenoist.Nix
                jnoortheen.nix-ide
              ];
            };
        })
      ];
    };
  in rec {
    inherit frontend;
    devShells."x86_64-linux".default = import ./shell.nix {
      inherit pkgs;
      config = {};
    };
    templates = {
      default = {
        path = ./templates/default;
        description = "Uni Wien Latex Template";
      };
      course = {
        path = ./templates/course;
        description = "Notes for a Course";
      };
    };
    #nixosModules =
    #home-manager.nixosModules.home-manager
    #{
    #  home-manager.useGlobalPkgs = true;
    #  home-manager.useUserPackages = true;
    #  home-manager.extraSpecialArgs = specialArgs;
    #};
    packages."x86_64-linux".default = documents.packages."x86_64-linux".default;
  };
}
