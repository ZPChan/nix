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
  config = lib.mkIf config.my.hyprland.enable {

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

    # wayland.windowManager.hyprland.enable = true;

    programs.waybar.enable = true;
    home.file = {
      ".config/waybar" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix/dotfiles/waybar";
      };
    };

    programs.hyprlock.enable = true;
    services.hypridle.enable = true;
    services.hyprpaper.enable = true;
    home.file = {
      ".config/hypr" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix/dotfiles/hypr";
      };
    };

    programs.wofi.enable = true;
    home.file = {
      ".config/wofi" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix/dotfiles/wofi";
      };
    };

    home.file = {
      ".config/backgrounds" = {
        source = ./../../dotfiles/backgrounds;
      };
    };

    programs.ghostty = {
      enable = true;
      settings = {
        theme = "catppuccin-mocha";
        font-family = "CaskaydiaCove Nerd Font";
        gtk-titlebar = false;
        background-opacity = 0.9;
        shell-integration-features = "ssh-terminfo,ssh-env";
      };
    };
  };
}
