{
  flake.modules.nixos.tmux = {
    programs.tmux.enable = true;
  };
  flake.modules.homeManager.tmux =
    { pkgs, ... }:
    {
      programs.tmux = {
        enable = true;
        baseIndex = 1;
        keyMode = "vi";
        escapeTime = 0;
        mouse = true;
        customPaneNavigationAndResize = true;
        plugins = with pkgs; [
          {
            plugin = tmuxPlugins.catppuccin;
            extraConfig = ''
              set -g @catppuccin_flavor "mocha"
              set -g @catppuccin_window_status_style "slanted"
            '';
          }
        ];
        extraConfig = ''
          set-option -g status-position top

          set -g status-right-length 100
          set -g status-left ""

          set -gF status-right "#{@catppuccin_status_session}"
        '';
      };
    };
}
