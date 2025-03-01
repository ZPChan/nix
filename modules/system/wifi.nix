{ pkgs, lib, config, ... }: {
  options = {
    services.wifi.enable = lib.mkEnableOption "enables wifi module";
  };
  config = lib.mkIf config.services.wifi.enable {
    environment.systemPackages = with pkgs; [
      networkmanagerapplet
    ];
    networking = {
      networkmanager.enable = true;
    };
  };
}

