{
  flake.modules.homeManager.hyprland = {
    wayland.windowManager.hyprland.settings = {

      menu = {
        _var = "wofi --show drun";
      };
      startupcommands = {
        _var = [
          "waybar & swaync & hyprpaper & hypridle"
        ];
      };

      layer_rule = {
        match.class = "wofi";
        no_anim = true;
      };
    };
  };
}
