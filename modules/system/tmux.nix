{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.tmux.enable = lib.mkEnableOption "tmux";
  };
  config = lib.mkIf config.my.tmux.enable {
    programs.tmux = {
      enable = true;
    };
  };
}
