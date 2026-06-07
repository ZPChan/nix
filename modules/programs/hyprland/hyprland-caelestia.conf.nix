{
  flake.modules.homeManager.hyprland-caelestia =
    {
      config,
      lib,
      ...
    }:
    {
      wayland.windowManager.hyprland.settings = {

        menu = {
          _var = "caelestia shell drawers toggle launcher";
        };
        startupcommands = {
          _var = [
            "caelestia shell -d && caelestia shell lock lock"
          ];
        };

        bind = [
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + SHIFT + Escape'")
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd('caelestia shell lock lock')")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + P'")
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd('caelestia shell mpris playPause')")
              (lib.generators.mkLuaInline "{locked=true}")
            ];
          }
          {
            _args = [
              "XF86AudioPlay"
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd('caelestia shell mpris playPause')")
              (lib.generators.mkLuaInline "{locked=true}")
            ];
          }
          {
            _args = [
              "XF86AudioPause"
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd('caelestia shell mpris playPause')")
              (lib.generators.mkLuaInline "{locked=true}")
            ];
          }
          {
            _args = [
              "XF86AudioNext"
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd('caelestia shell mpris next')")
              (lib.generators.mkLuaInline "{locked=true}")
            ];
          }
          {
            _args = [
              "XF86AudioPrev"
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd('caelestia shell mpris previous')")
              (lib.generators.mkLuaInline "{locked=true}")
            ];
          }
        ];
      };

      home.file = {
        ".config/caelestia/shell.json".source =
          config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix/modules/programs/hyprland/caelestia-shell.config.json";
      };
    };
}
