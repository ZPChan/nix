{
  flake.modules.homeManager.hyprland = {
    wayland.windowManager.hyprland.settings = {
      exec-once = [
        "waybar & swaync & hyprpaper & hypridle"
      ];
      "$menu" = "wofi --show drun";
      layerrule = "no_anim on, match:class = wofi";
    };
  };
}
