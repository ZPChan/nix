{ inputs, ... }:
{
  flake.modules.nixos.system-simple = {
    imports = with inputs.self.modules.nixos; [
      autogc
      autoupdate
      catppuccin
      home-manager
      locale
      system-minimal
    ];
  };
  flake.modules.homeManager.system-simple = {
    imports = with inputs.self.modules.homeManager; [
      catppuccin
      system-minimal
    ];
  };
}
