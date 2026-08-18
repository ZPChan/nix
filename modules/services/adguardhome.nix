{
  flake.modules.nixos.adguardhome = {
    services.adguardhome = {
      enable = true;
      host = "192.168.10.126";
      port = 3000;
    };
    networking.firewall = {
      allowedTCPPorts = [
        53
        80
        443
        3000
      ];
      allowedUDPPorts = [
        53
        443
      ];
    };
  };
}
