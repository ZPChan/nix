{
  flake.modules.nixos.adguardhome = {
    services.adguardhome = {
      enable = true;
      host = "192.168.10.136";
      port = 3000;
      settings = {
        dns = {
          bind_hosts = [
            "192.168.10.136"
          ];
          port = 53;
        };
      };
    };
    networking.firewall = {
      allowedTCPPorts = [
        53
        3000
      ];
      allowedUDPPorts = [
        53
      ];
    };
  };
}
