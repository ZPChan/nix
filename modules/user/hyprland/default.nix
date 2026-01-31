{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.hyprland.enable = lib.mkEnableOption "enables hyprland module";
  };
  imports = [
    ./hyprland.conf.nix
    ./hypridle.conf.nix
    ./hyprlock.conf.nix
    ./hyprpaper.conf.nix
  ];
  config = lib.mkIf config.my.hyprland.enable {
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
          file_manager = "${pkgs.nautilus}/bin/nautilus";
        };
      };
    };

    programs.waybar.enable = true;
    home.file = {
      ".config/waybar/config.jsonc".source = ./waybar.config.jsonc;
      ".config/waybar/style.css".source = ./waybar.style.css;
      ".config/waybar/mocha.css".source = ./waybar.mocha.css;
    };

    programs.hyprlock.enable = true;
    services.hypridle.enable = true;
    services.hyprpaper.enable = true;

    programs.wofi.enable = true;
    home.file.".config/wofi/style.css".source = ./wofi.style.css;

    home.file.".config/wallpaper.png".source = ./wallpaper/shaded.png;

    programs.ghostty = {
      enable = true;
      settings = {
        font-family = "CaskaydiaCove Nerd Font";
        gtk-titlebar = false;
        background-opacity = 0.9;
        shell-integration-features = "ssh-terminfo,ssh-env";
      };
    };
  };
}
