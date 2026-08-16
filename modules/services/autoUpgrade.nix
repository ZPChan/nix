{
  inputs,
  ...
}:
{
  flake.modules.nixos.autoUpgrade = {
    system.autoUpgrade = {
      enable = true;
      flake = "github:ZPChan/nix";
      dates = "04:00";
      randomizedDelaySec = "30min";
    };
  };
  flake.modules.nixos.autoUpgrade-allowReboot = {
    imports = with inputs.self.modules.nixos; [
      autoUpgrade
    ];
    system.autoUpgrade = {
      allowReboot = true;
      rebootWindow = {
        lower = "04:00";
        upper = "05:00";
      };
    };
  };
}
