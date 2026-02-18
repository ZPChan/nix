{ inputs, ... }:
{
  flake.modules.nixos.system-wsl = {
    imports = with inputs.self.modules.nixos; [
      system-simple
      wsl
    ];
  };
  flake.modules.homeManager.system-wsl = {
    imports = with inputs.self.modules.homeManager; [
      system-simple
    ];
  };
}
