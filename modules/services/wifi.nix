{
  flake.modules.nixos.wifi = {
    networking.wireless = {
      enable = true;
      secretsFile = "/run/secrets/wifi";
      networks = {
        main = {
          ssid = "Dorkfest";
          pskRaw = "ext:main_psk";
        };
      };
    };
    sops.secrets.wifi.owner = "wpa_supplicant";
  };
}
