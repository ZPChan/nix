{
  flake.modules.nixos.adguardhome = {
    services.adguardhome = {
      enable = true;
      port = 8080;
    };
    networking.firewall = {
      allowedTCPPorts = [
        53
        443
        3000
        8080
      ];
      allowedUDPPorts = [
        53
        443
      ];
    };
  };
}
