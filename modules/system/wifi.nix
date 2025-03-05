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
    services.wifi.enable = true;
    environment.systemPackages = with pkgs; [
      networkmanagerapplet
    ];
    networking = {
      networkmanager.enable = true;
    };
  };
}
