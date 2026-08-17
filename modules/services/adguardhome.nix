{
  flake.modules.nixos.adguardhome = {
    services.adguardhome = {
      enable = true;
      host = "127.0.0.1";
      port = 53;
      settings = { };
    };

    networking.firewall = {
      enable = true;
      allowedTCPPorts = [
        53
      ];
      allowedUDPPorts = [
        53
      ];
    };
  };
}
