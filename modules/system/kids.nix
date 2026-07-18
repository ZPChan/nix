{ inputs, ... }:
{
  flake.modules.nixos.system-kids = {
    imports = with inputs.self.modules.nixos; [
      autogc
      cinnamon
      blender
      firefox
      ghostty
      gimp
      home-manager
      libreoffice
      locale
      networkmanager
      noise-filtering
      printing
      sound
      system-minimal
    ];
  };
  flake.modules.homeManager.system-kids = {
    imports = with inputs.self.modules.homeManager; [
      system-minimal
      vinegar
    ];
  };
}
