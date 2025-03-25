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
        set-option -g allow-rename off

        # Configure the catppuccin plugin
        set -g @catppuccin_flavor "mocha"
        set -g @catppuccin_window_status_style "rounded"

        # Make the status line pretty and add some modules
        set -g status-right-length 100
        set -g status-left-length 100
        set -g status-left ""
        set -g status-right "#{E:@catppuccin_status_application}"
        set -ag status-right "#{E:@catppuccin_status_session}"

      '';
      plugins = with pkgs; [
        tmuxPlugins.catppuccin
      ];
    };
  };
}
