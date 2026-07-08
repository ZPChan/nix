{ inputs, ... }:
{
  flake.modules.nixos.cinnamon = {
    imports = with inputs.self.modules.nixos; [
      xserver
    ];

    services.xserver = {
      displayManager.lightdm.enable = true;
      desktopManager.cinnamon.enable = true;
    };

  };
}
