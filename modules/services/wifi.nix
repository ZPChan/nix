{
  flake.modules.nixos.wifi = {
    networking.wireless = {
      enable = true;
      secretsFile = "/run/secrets/wifi";
      networks.Dorkfest.pskRaw = "ext:main_psk";
      networks.ATT6XER3NI.pskRaw = "ext:timberlane_psk";
    };
    sops.secrets.wifi.owner = "wpa_supplicant";
  };
}
