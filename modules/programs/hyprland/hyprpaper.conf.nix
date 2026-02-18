{
  flake.modules.homeManager.hyprland = {
    services.hyprpaper.settings = {
      ipc = false;
      splash = false;
      wallpaper = {
        monitor = "";
        path = "~/.config/wallpaper.png";
      };
    };
  };
}
