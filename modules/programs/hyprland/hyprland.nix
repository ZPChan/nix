{
  flake.modules.nixos.hyprland =
    { pkgs, ... }:
    {
      environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
      };

      programs.hyprland = {
        enable = true;
        withUWSM = true;
        xwayland.enable = true;
      };

      xdg.portal = {
        enable = true;
        extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      };

      environment.systemPackages = with pkgs; [
        waybar
        swaynotificationcenter
        libnotify
        hyprpaper
        wofi
        hyprshot
        hyprlock
        hypridle
        hyprlandPlugins.hyprscrolling
      ];

      services.udisks2.enable = true;

      fonts.packages = with pkgs; [
        font-awesome
      ];
    };

  flake.modules.homeManager.hyprland =
    { pkgs, ... }:
    {
      wayland.windowManager.hyprland = {
        enable = true;
        systemd.enable = false;
        plugins = [
          pkgs.hyprlandPlugins.hyprscrolling
        ];
      };

      gtk = {
        enable = true;
        theme = {
          package = pkgs.magnetic-catppuccin-gtk.override {
            size = "compact";
          };
          name = "Catppuccin-GTK-Dark-Compact";
        };
      };

      services.udiskie = {
        enable = true;
        settings = {
          # workaround for
          # https://github.com/nix-community/home-manager/issues/632
          program_options = {
            file_manager = "${pkgs.ghostty}/bin/ghostty -e ${pkgs.yazi}/bin/yazi";
          };
        };
      };

      programs.waybar.enable = true;
      programs.hyprlock.enable = true;
      services.hypridle.enable = true;
      services.hyprpaper.enable = true;

      programs.wofi.enable = true;

      home.file = {
        ".config/waybar/config.jsonc".source = ./waybar.config.jsonc;
        ".config/waybar/style.css".source = ./waybar.style.css;
        ".config/waybar/mocha.css".source = ./waybar.mocha.css;
      };
      home.file.".config/wofi/style.css".source = ./wofi.style.css;

      home.file.".config/wallpaper.png".source = ./wallpaper/shaded.png;

    };

}
