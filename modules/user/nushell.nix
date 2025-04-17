{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.nushell.enable = lib.mkEnableOption "enables nushell module";
  };
  config = lib.mkIf config.my.nushell.enable {
    programs.nushell = {
      enable = true;
      extraConfig = ''
        $env.LS_COLORS = (vivid generate catppuccin-mocha)
        $env.config.edit_mode = 'vi'
      '';
    };
    catppuccin.nushell.enable = true;
  };
}
