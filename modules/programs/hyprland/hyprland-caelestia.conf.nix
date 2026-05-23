{
  flake.modules.homeManager.hyprland-caelestia = 
    {
      config, ...
    }:
    {
    wayland.windowManager.hyprland.settings = {
      exec-once = [
          "caelestia-shell"
      ];
      "$menu" = "caelestia shell drawers toggle launcher";
      bind = [
        "$mainMod SHIFT, escape, exec, caelestia shell lock lock"
      ];
    };

    home.file = {
      ".config/caelestia/shell.json".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix/modules/programs/hyprland/caelestia-shell.config.json";
    };
  };
}

