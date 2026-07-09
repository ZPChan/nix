{ inputs, ... }:
{
  flake.modules.nixos.system-kids = {
    imports = with inputs.self.modules.nixos; [
      autogc
      cinnamon
      firefox
      flatpak
      ghostty
      home-manager
      libreoffice
      locale
      networkmanager
      noise-filtering
      printing
      sound
      system-minimal
      vinegar
    ];
  };
  flake.modules.homeManager.system-kids = {
    imports = with inputs.self.modules.homeManager; [
      system-minimal
    ];
  };
}
