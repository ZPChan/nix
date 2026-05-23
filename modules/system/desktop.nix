{ inputs, ... }:
{
  flake.modules.nixos.system-desktop = {
    imports = with inputs.self.modules.nixos; [
      bluetooth
      control
      ghostty
      hyprland-caelestia
      networkmanager
      printing
      slack
      sound
      system-simple
      thunderbird
      xserver
      zen
    ];
  };
  flake.modules.homeManager.system-desktop = {
    imports = with inputs.self.modules.homeManager; [
      ghostty
      hyprland-caelestia
      system-simple
    ];
  };
}
