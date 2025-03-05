{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.xserver.enable = lib.mkEnableOption "enables xserver module";
  };
  config = lib.mkIf config.my.xserver.enable {
    services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };
}
