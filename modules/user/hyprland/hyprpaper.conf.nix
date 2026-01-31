{
  lib,
  config,
  ...
}:
{
  config = lib.mkIf config.my.hyprland.enable {
    services.hyprpaper.settings = {
      ipc = false;
      wallpaper = {
        monitor = "";
        path = "~/.config/wallpaper.png";
      };
    };
  };
}
