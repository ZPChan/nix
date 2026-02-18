{ inputs, ... }:
{
  flake.modules.nixos.system-desktop = {
    imports = with inputs.self.modules.nixos; [
      ghostty
      hyprland
      networkmanager
      printing
      sound
      system-simple
      xserver
      zen
    ];
  };
  flake.modules.homeManager.system-desktop = {
    imports = with inputs.self.modules.homeManager; [
      ghostty
      hyprland
      system-simple
    ];
  };
}
