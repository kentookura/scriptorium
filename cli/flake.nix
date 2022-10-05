{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    haskell-flake.url = "github:srid/haskell-flake";
  };
  outputs = inputs @ {
    self,
    nixpkgs,
    flake-parts,
    ...
  }:
    flake-parts.lib.mkFlake {inherit self;} {
      systems = ["x86_64-linux"];
      imports = [inputs.haskell-flake.flakeModule];
      perSystem = {
        self',
        pkgs,
        ...
      }: {
        haskellProjects.default = {
          root = ./.;
        };
      };
    };
}
