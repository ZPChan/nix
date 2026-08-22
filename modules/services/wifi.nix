{
  flake.modules.nixos.wifi = {
    networking.wireless = {
      enable = true;
      secretsFile = "/run/secrets/wifi";
      networks = {
        main = {
          ssid = "ext:main_ssid";
          psk = "ext:main_psk";
        };
      };
    };
    sops.secrets.wifi = { };
  };
}
