{
  description = "University Course Template";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-21.05;
    flake-utils.url = github:numtide/flake-utils;
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    devShells.x86_64-linux.default = import ./shell.nix {inherit pkgs;};
    # use cal.py to make a calendar/course derivation.
    packages.x86_64-linux.default = pkgs.mkYarnPackage {
      name = "course-template";
      src = ./.;
      packageJSON = ./package.json;
      yarnLock = ./yarn.lock;
      yarnNix = ./yarn.nix;
    };
  };
}
