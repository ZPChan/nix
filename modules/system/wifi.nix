{ pkgs, lib, config, ... }: {
  options = {
    wifi.enable = lib.mkEnableOption "enables wifi module";
  };
  config = lib.mkIf config.wifi.enable {
    environment.systemPackages = with pkgs; [
      networkmanagerapplet
    ];
    networking = {
      networkmanager.enable = true;
    };
  };
}

