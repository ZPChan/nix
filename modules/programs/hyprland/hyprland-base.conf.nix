{
  flake.modules.homeManager.hyprland-base =
    { lib, ... }:
    {
      wayland.windowManager.hyprland.configType = "lua";
      wayland.windowManager.hyprland.settings = {

        mainMod = {
          _var = "SUPER";
        };
        terminal = {
          _var = "ghostty";
        };
        fileManager = {
          _var = "ghostty -e yazi";
        };

        startupcommands = {
          _var = [
            "hyprctl setcursor catppuccin-mocha-dark-cursors 28"
            "systemctl --user start hyprpolkitagent"
          ];
        };

        monitor = [
          {
            output = "";
            mode = "preferred";
            position = "auto";
            scale = 1;
          }
        ];

        on = {
          _args = [
            "hyprland.start"
            (lib.generators.mkLuaInline ''
              function()
                for i, v in ipairs(startupcommands) do
                  hl.exec_cmd(v)
                end
              end
            '')
          ];
        };

        config = {
          general = {
            gaps_in = 8;
            gaps_out = 8;
            border_size = 4;
            col = {
              active_border = {
                colors = [
                  (lib.generators.mkLuaInline "colors.mauve")
                  (lib.generators.mkLuaInline "colors.flamingo")
                ];
                angle = 90;
              };
              inactive_border = lib.generators.mkLuaInline "colors.surface0";
            };
            resize_on_border = true;
            layout = "scrolling";
            allow_tearing = false;
          };
          decoration = {
            rounding = 10;
            rounding_power = 2;
            active_opacity = 1.0;
            inactive_opacity = 0.95;
            shadow = {
              enabled = true;
              range = 4;
              render_power = 3;
              color = "rgba(1a1a1aee)";
            };
            blur = {
              enabled = true;
              size = 3;
              passes = 1;
              vibrancy = 0.1696;
            };
          };
          xwayland = {
            force_zero_scaling = true;
          };
          input = {
            kb_layout = "us";
            kb_variant = "";
            kb_model = "";
            kb_rules = "";
            kb_options = "";
            follow_mouse = 1;
            touchpad = {
              natural_scroll = true;
            };

            sensitivity = 0;
          };

          animations = {
            enabled = true;
          };

          dwindle = {
            preserve_split = true;
          };

          scrolling = {
            fullscreen_on_one_column = true;
            column_width = 0.48;
            explicit_column_widths = "0.32,0.48,0.64,0.96";
          };

          misc = {
            force_default_wallpaper = 0;
          };
        };

        env = [
          {
            _args = [
              "XCURSOR_SIZE"
              "24"
            ];
          }
          {
            _args = [
              "HYPRCURSOR_SIZE"
              "24"
            ];
          }
        ];

        curve = [
          {
            _args = [
              "easeOutQuint"
              {
                type = "bezier";
                points = lib.generators.mkLuaInline "{{0.23,1},{0.32,1}}";
              }
            ];
          }
          {
            _args = [
              "easeInOutCubic"
              {
                type = "bezier";
                points = lib.generators.mkLuaInline "{{0.65,0.05},{0.36,1}}";
              }
            ];
          }
          {
            _args = [
              "linear"
              {
                type = "bezier";
                points = lib.generators.mkLuaInline "{{0,0},{1,1}}";
              }
            ];
          }
          {
            _args = [
              "almostLinear"
              {
                type = "bezier";
                points = lib.generators.mkLuaInline "{{0.5,0.5},{0.75,1.0}}";
              }
            ];
          }
          {
            _args = [
              "quick"
              {
                type = "bezier";
                points = lib.generators.mkLuaInline "{{0.15,0},{0.1,1}}";
              }
            ];
          }
        ];

        animation = [
          {
            leaf = "global";
            enabled = true;
            speed = 10;
            bezier = "default";
          }
          {
            leaf = "border";
            enabled = true;
            speed = 5.39;
            bezier = "easeOutQuint";
          }
          {
            leaf = "windows";
            enabled = true;
            speed = 4.79;
            bezier = "easeOutQuint";
          }
          {
            leaf = "windowsIn";
            enabled = true;
            speed = 4.1;
            bezier = "easeOutQuint";
            style = "popin 87%";
          }
          {
            leaf = "windowsOut";
            enabled = true;
            speed = 1.49;
            bezier = "linear";
            style = "popin 87%";
          }
          {
            leaf = "fadeIn";
            enabled = true;
            speed = 1.73;
            bezier = "almostLinear";
          }
          {
            leaf = "fadeOut";
            enabled = true;
            speed = 1.46;
            bezier = "almostLinear";
          }
          {
            leaf = "fade";
            enabled = true;
            speed = 3.03;
            bezier = "quick";
          }
          {
            leaf = "layers";
            enabled = true;
            speed = 3.81;
            bezier = "easeOutQuint";
          }
          {
            leaf = "layersIn";
            enabled = true;
            speed = 4;
            bezier = "easeOutQuint";
            style = "fade";
          }
          {
            leaf = "layersOut";
            enabled = true;
            speed = 1.5;
            bezier = "linear";
            style = "fade";
          }
          {
            leaf = "fadeLayersIn";
            enabled = true;
            speed = 1.79;
            bezier = "almostLinear";
          }
          {
            leaf = "fadeLayersOut";
            enabled = true;
            speed = 1.39;
            bezier = "almostLinear";
          }
          {
            leaf = "workspaces";
            enabled = true;
            speed = 1.94;
            bezier = "almostLinear";
            style = "fade";
          }
          {
            leaf = "workspacesIn";
            enabled = true;
            speed = 1.21;
            bezier = "almostLinear";
            style = "fade";
          }
          {
            leaf = "workspacesOut";
            enabled = true;
            speed = 1.94;
            bezier = "almostLinear";
            style = "fade";
          }
        ];

        window_rule = [
          {
            match.class = ".*";
            suppress_event = "maximize";
          }
        ];

        bind = [
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + Escape'")
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd(terminal)")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + SHIFT + Q'")
              (lib.generators.mkLuaInline "hl.dsp.window.close()")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + E'")
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd(fileManager)")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + V'")
              (lib.generators.mkLuaInline "hl.dsp.window.float({action = 'toggle'})")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + N'")
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd(menu)")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + SHIFT + R'")
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd('hyprctl reload')")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + S'")
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd('grim - | satty -f - --copy-command wl-copy -o \"~/Pictures/Screenshots/%Y%m%d_%H%M%S.png\"')")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + SHIFT + S'")
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd('grim -g \"$(slurp)\" - | satty -f - --copy-command wl-copy -o \"~/Pictures/Screenshots/%Y%m%d_%H%M%S.png\"')")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + F'")
              (lib.generators.mkLuaInline "hl.dsp.window.fullscreen({action = 'toggle'})")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + H'")
              (lib.generators.mkLuaInline "hl.dsp.focus({direction = 'l'})")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + L'")
              (lib.generators.mkLuaInline "hl.dsp.focus({direction = 'r'})")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + K'")
              (lib.generators.mkLuaInline "hl.dsp.focus({direction = 'u'})")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + J'")
              (lib.generators.mkLuaInline "hl.dsp.focus({direction = 'd'})")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + SHIFT + H'")
              (lib.generators.mkLuaInline "hl.dsp.layout('consume_or_expel prev')")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + SHIFT + L'")
              (lib.generators.mkLuaInline "hl.dsp.layout('consume_or_expel next')")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + SHIFT + K'")
              (lib.generators.mkLuaInline "hl.dsp.window.move({direction = 'u'})")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + SHIFT + J'")
              (lib.generators.mkLuaInline "hl.dsp.window.move({direction = 'd'})")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + CTRL + H'")
              (lib.generators.mkLuaInline "hl.dsp.layout('colresize -conf')")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + CTRL + L'")
              (lib.generators.mkLuaInline "hl.dsp.layout('colresize +conf')")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + CTRL + K'")
              (lib.generators.mkLuaInline "hl.dsp.window.resize({x = 0, y = 20})")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + CTRL + J'")
              (lib.generators.mkLuaInline "hl.dsp.window.resize({x = 0, y = -20})")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + 1'")
              (lib.generators.mkLuaInline "hl.dsp.focus({workspace = 1})")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + 2'")
              (lib.generators.mkLuaInline "hl.dsp.focus({workspace = 2})")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + 3'")
              (lib.generators.mkLuaInline "hl.dsp.focus({workspace = 3})")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + 4'")
              (lib.generators.mkLuaInline "hl.dsp.focus({workspace = 4})")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + 5'")
              (lib.generators.mkLuaInline "hl.dsp.focus({workspace = 5})")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + 6'")
              (lib.generators.mkLuaInline "hl.dsp.focus({workspace = 6})")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + 7'")
              (lib.generators.mkLuaInline "hl.dsp.focus({workspace = 7})")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + 8'")
              (lib.generators.mkLuaInline "hl.dsp.focus({workspace = 8})")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + 9'")
              (lib.generators.mkLuaInline "hl.dsp.focus({workspace = 9})")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + 0'")
              (lib.generators.mkLuaInline "hl.dsp.focus({workspace = 10})")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + SHIFT + 1'")
              (lib.generators.mkLuaInline "hl.dsp.window.move({workspace = 1})")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + SHIFT + 2'")
              (lib.generators.mkLuaInline "hl.dsp.window.move({workspace = 2})")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + SHIFT + 3'")
              (lib.generators.mkLuaInline "hl.dsp.window.move({workspace = 3})")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + SHIFT + 4'")
              (lib.generators.mkLuaInline "hl.dsp.window.move({workspace = 4})")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + SHIFT + 5'")
              (lib.generators.mkLuaInline "hl.dsp.window.move({workspace = 5})")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + SHIFT + 6'")
              (lib.generators.mkLuaInline "hl.dsp.window.move({workspace = 6})")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + SHIFT + 7'")
              (lib.generators.mkLuaInline "hl.dsp.window.move({workspace = 7})")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + SHIFT + 8'")
              (lib.generators.mkLuaInline "hl.dsp.window.move({workspace = 8})")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + SHIFT + 9'")
              (lib.generators.mkLuaInline "hl.dsp.window.move({workspace = 9})")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + SHIFT + 0'")
              (lib.generators.mkLuaInline "hl.dsp.window.move({workspace = 10})")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + Z'")
              (lib.generators.mkLuaInline "hl.dsp.workspace.toggle_special('zspace')")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + SHIFT + Z'")
              (lib.generators.mkLuaInline "hl.dsp.window.move({workspace = 'special:zspace'})")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + M'")
              (lib.generators.mkLuaInline "hl.dsp.workspace.swap_monitors({monitor1 = 0, monitor2 = 1})")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + mouse_down'") # scroll down
              (lib.generators.mkLuaInline "hl.dsp.focus({workspace = 'e+1'})")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + mouse_up'") # scroll up
              (lib.generators.mkLuaInline "hl.dsp.focus({workspace = 'e-1'})")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + code:21'") # equals key
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd('wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+')")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + code:20'") # minus key
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd('wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-')")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + mouse:272'") # left click
              (lib.generators.mkLuaInline "hl.dsp.window.drag()")
              (lib.generators.mkLuaInline "{mouse=true}")
            ];
          }
          {
            _args = [
              (lib.generators.mkLuaInline "mainMod .. ' + mouse:273'") # right click
              (lib.generators.mkLuaInline "hl.dsp.window.resize()")
              (lib.generators.mkLuaInline "{mouse=true}")
            ];
          }
          {
            _args = [
              "XF86AudioRaiseVolume"
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd('wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+')")
              (lib.generators.mkLuaInline "{repeating=true,locked=true}")
            ];
          }
          {
            _args = [
              "XF86AudioLowerVolume"
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd('wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-')")
              (lib.generators.mkLuaInline "{repeating=true,locked=true}")
            ];
          }
          {
            _args = [
              "XF86AudioMute"
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle')")
              (lib.generators.mkLuaInline "{locked=true}")
            ];
          }
          {
            _args = [
              "XF86AudioMicMute"
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle')")
              (lib.generators.mkLuaInline "{locked=true}")
            ];
          }
          {
            _args = [
              "XF86MonBrightnessUp"
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd('brightnessctl s 10%+')")
              (lib.generators.mkLuaInline "{locked=true}")
            ];
          }
          {
            _args = [
              "XF86MonBrightnessDown"
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd('brightnessctl s 10%-')")
              (lib.generators.mkLuaInline "{locked=true}")
            ];
          }
          {
            _args = [
              "XF86AudioNext"
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd('playerctl next')")
              (lib.generators.mkLuaInline "{locked=true}")
            ];
          }
          {
            _args = [
              "XF86AudioPause"
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd('playerctl play-pause')")
              (lib.generators.mkLuaInline "{locked=true}")
            ];
          }
          {
            _args = [
              "XF86AudioPlay"
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd('playerctl play-pause')")
              (lib.generators.mkLuaInline "{locked=true}")
            ];
          }
          {
            _args = [
              "XF86AudioPrev"
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd('playerctl previous')")
              (lib.generators.mkLuaInline "{locked=true}")
            ];
          }
        ];
      };
    };
}
