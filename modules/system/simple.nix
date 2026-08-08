{ inputs, ... }:
{
  flake.modules.nixos.system-simple = {
    imports = with inputs.self.modules.nixos; [
      autoUpgrade
      autogc
      catppuccin
      system-bare
    ];
  };
  flake.modules.homeManager.system-simple = {
    imports = with inputs.self.modules.homeManager; [
      catppuccin
      system-bare
    ];
  };
}
