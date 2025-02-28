{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.programs.hyprland.enable {
    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };

    programs.hyprland = {
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
    ];

    fonts.packages = with pkgs; [
      font-awesome
    ];
  };
}
