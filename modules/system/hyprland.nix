{ pkgs, lib, config, ... }: {
  options = {
    hyprland.enable = lib.mkEnableOption "enables hyprland module";
  };
  config = lib.mkIf config.hyprland.enable {
    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };

    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };

    environment.systemPackages = with pkgs; [
      ghostty
      waybar
      swaynotificationcenter
      libnotify
      hyprpaper
      wofi
      hyprshot
      hyprlock
      hypridle
      magnetic-catppuccin-gtk
      nwg-look
    ];

    fonts.packages = with pkgs; [
      font-awesome
    ];
  };
}
