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
        $env.config.buffer_editor = 'nvim'
        $env.config.show_banner = false
      '';
    };
    catppuccin.nushell.enable = true;
    my.lang.nu.enable = lib.mkDefault true;
  };
}
