{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.hyprland.enable = lib.mkEnableOption "hyprland";
  };
  config = lib.mkIf config.my.hyprland.enable {
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
      nautilus
      brightnessctl
    ];

    services.udisks2.enable = true;

    fonts.packages = with pkgs; [
      font-awesome
    ];
  };
}
