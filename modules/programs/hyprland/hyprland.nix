{ inputs, ... }:
{
  flake.modules.nixos.hyprland =
    { pkgs, ... }:
    {
      imports = with inputs.self.modules.nixos; [
        hyprland-base
      ];

      environment.systemPackages = with pkgs; [
        waybar
        swaynotificationcenter
        hyprpaper
        wofi
        hyprlock
        hypridle
        hyprpolkitagent
      ];
    };

  flake.modules.homeManager.hyprland =
    { pkgs, ... }:
    {
      imports = with inputs.self.modules.homeManager; [
        hyprland-base
      ];

      programs.waybar.enable = true;
      programs.hyprlock.enable = true;
      services.hypridle.enable = true;
      services.hyprpaper.enable = true;

      programs.wofi.enable = true;

      home.file = {
        ".config/waybar/config.jsonc".source = ./waybar.config.jsonc;
        ".config/waybar/style.css".source = ./waybar.style.css;
        ".config/waybar/mocha.css".source = ./waybar.mocha.css;

        ".config/wofi/style.css".source = ./wofi.style.css;

        ".config/wallpaper.png".source = ./wallpaper/shaded.png;
      };
    };

}
