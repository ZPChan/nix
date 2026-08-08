{
  flake.modules.nixos.autoUpgrade = {
    system.autoUpgrade = {
      enable = true;
      flake = "github:ZPChan/nix";
      dates = "04:00";
    };
  };
}
