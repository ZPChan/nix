{ inputs, ... }:
{
  flake.modules.nixos.cli-tools-advanced = {
    imports = with inputs.self.modules.nixos; [
      cli-tools-basic
      lazyvim-deps
    ];
  };
  flake.modules.homeManager.cli-tools-advanced = {
    imports = with inputs.self.modules.homeManager; [
      cli-tools-basic
      lazyvim-deps
      starship
    ];
  };
}
