{ inputs, ... }:
{
  flake-file.inputs = {
    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  flake.modules.nixos.hyprland-caelestia =
    { pkgs, ... }:
    {
      imports = with inputs.self.modules.nixos; [
        hyprland-base
      ];
    };

  flake.modules.homeManager.hyprland-caelestia =
    { pkgs, ... }:
    {
      imports = [
        inputs.self.modules.homeManager.hyprland-base
        inputs.caelestia-shell.homeManagerModules.default
      ];

      programs.caelestia = {
        enable = true;
        cli = {
          enable = true;
        };
      };

      home.file = {
        "Pictures/Wallpapers/shaded.png".source = ./wallpaper/shaded.png;
      };
    };

}

