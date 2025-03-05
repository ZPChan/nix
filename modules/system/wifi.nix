{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.wifi.enable = lib.mkEnableOption "enables wifi module";
  };
  config = lib.mkIf config.my.wifi.enable {
    environment.systemPackages = with pkgs; [
      networkmanagerapplet
    ];
    networking = {
      networkmanager.enable = true;
    };
  };
}
