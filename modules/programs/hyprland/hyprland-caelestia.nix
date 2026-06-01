{ inputs, ... }:
{
  flake-file.inputs = {
    caelestia-shell = {
      url = "github:caelestia-dots/shell";
    };
  };

  flake.modules.nixos.hyprland-caelestia = {
    imports = with inputs.self.modules.nixos; [
      hyprland-base
    ];
  };

  flake.modules.homeManager.hyprland-caelestia = {
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
      "Pictures/Wallpapers/wallhaven-28g619_2560x1440.png".source =
        ./wallpaper/wallhaven-28g619_2560x1440.png;
      "Pictures/Wallpapers/wallhaven-45zm85_2560x1440.png".source =
        ./wallpaper/wallhaven-45zm85_2560x1440.png;
      "Pictures/Wallpapers/wallhaven-kwvy91_2560x1440.png".source =
        ./wallpaper/wallhaven-kwvy91_2560x1440.png;
      "Pictures/Wallpapers/wallhaven-nmpk9m_2560x1440.png".source =
        ./wallpaper/wallhaven-nmpk9m_2560x1440.png;
      "Pictures/Wallpapers/wallhaven-w55mgq_2560x1440.png".source =
        ./wallpaper/wallhaven-w55mgq_2560x1440.png;
    };
  };

}
