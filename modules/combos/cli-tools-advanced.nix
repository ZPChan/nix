{ inputs, ... }:
{
  flake.modules.nixos.cli-tools-advanced = {
    imports = with inputs.self.modules.nixos; [
      cli-tools-basic
    ];
  };
  flake.modules.homeManager.cli-tools-advanced = {
    imports = with inputs.self.modules.homeManager; [
      cli-tools-basic
      lazyvim
      starship
    ];
  };
}
