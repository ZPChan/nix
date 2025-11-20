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
        $env.config.hooks.env_change.PWD = (
          $env.config.hooks.env_change.PWD | append (source nu-hooks/nu-hooks/direnv/config.nu)
        )
      '';
    };
    catppuccin.nushell.enable = true;
    my.lang.nu.enable = lib.mkDefault true;
  };
}
