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
      '';
      plugins = with pkgs; [
        tmuxPlugins.catppuccin
      ];
    };
  };
}
