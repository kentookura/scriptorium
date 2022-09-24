{config, pkgs, lib, ... } @ args:
with lib;
let cfg = config.documents;
{
  options = {
    documents = mkOption {
      types = types.listOf (types.submodule (import ./options.nix));
    }
  };
  config = {
    k
  };
}
