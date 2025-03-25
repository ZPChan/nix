{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.tmux.enable = lib.mkEnableOption "enables tmux module";
  };
  config = lib.mkIf config.my.tmux.enable {
    programs.tmux = {
      enable = true;
      baseIndex = 1;
      keyMode = "vi";
      escapeTime = 0;
      mouse = true;
      customPaneNavigationAndResize = true;
      extraConfig = ''
        set-option -g status-position top

        set -g @catppuccin_flavor "mocha"

        set -g status-right-length 100
        set -g status-left ""

        # Window
        set -g @catppuccin_window_status_style "custom"
        set -g window-status-separator ""

        ## Window global/default configuration
        set -g @catppuccin_window_default_text " #{window_name}"
        set -g @catppuccin_window_status "icon"
        set -g @catppuccin_window_default_fill "number"
        set -g @catppuccin_window_number_position "left"

        set -g @catppuccin_window_left_separator "█"
        set -g @catppuccin_window_middle_separator "█"
        set -g @catppuccin_window_right_separator "█"

        ## Window current configuration
        set -g @catppuccin_window_current_text "#{window_name}"
        set -g @catppuccin_window_current_fill "all"
        set -g @catppuccin_window_current_middle_separator "#[reverse] 󰿟 #[noreverse]"

        # Status modules config
        set -g @catppuccin_date_time_text "%d-%m %H:%M"

        # Status
        set -gF  status-right "#{@catppuccin_status_directory}"
        set -agF status-right "#{@catppuccin_status_session}"
        set -agF status-right "#{@catppuccin_status_user}"
        set -agF status-right "#{@catppuccin_status_host}"
      '';
      plugins = with pkgs; [
        tmuxPlugins.catppuccin
      ];
    };
  };
}
