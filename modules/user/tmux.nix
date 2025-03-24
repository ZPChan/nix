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
      mouse = true;
      customPaneNavigationAndResize = true;
      plugins = with pkgs; [
        tmuxPlugins.catppuccin
      ];
    };
  };
}
