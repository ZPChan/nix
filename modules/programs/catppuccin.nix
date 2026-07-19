{ inputs, ... }:
{
  flake-file.inputs = {
    catppuccin.url = "github:catppuccin/nix";
  };

  flake.modules.nixos.catppuccin = {
    imports = [ inputs.catppuccin.nixosModules.catppuccin ];
    catppuccin = {
      enable = true;
      autoEnable = true;
      flavor = "mocha";
      accent = "mauve";
    };
  };

  flake.modules.homeManager.catppuccin = {
    imports = [ inputs.catppuccin.homeModules.catppuccin ];
    catppuccin = {
      enable = true;
      autoEnable = true;
      flavor = "mocha";
      accent = "mauve";
      nushell.enable = true;
    };
  };
}
