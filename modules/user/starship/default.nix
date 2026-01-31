{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.starship.enable = lib.mkEnableOption "enables starship module";
  };
  config = lib.mkIf config.my.starship.enable {
    programs.starship = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
      settings = import ./starship.conf.nix;
    };
  };
}
