{
  flake.modules.nixos.wifi = { config, ... }: {
    users.groups.wpa_supplicant = { };
    users.users.wpa_supplicant = {
      isSystemUser = true;
      group = config.users.groups.wpa_supplicant.name;
    };

    sops.secrets.wifi.owner = "wpa_supplicant";

    networking.wireless = {
      enable = true;
      secretsFile = config.sops.secrets.wifi.path;
      networks.Dorkfest.pskRaw = "ext:main_psk";
      networks.ATT6XER3NI.pskRaw = "ext:timberlane_psk";
    };
  };
}
