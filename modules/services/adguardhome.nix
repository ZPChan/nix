{
  flake.modules.nixos.adguardhome = {
    services.adguardhome = {
      enable = true;
    };
    networking.firewall = {
      allowedTCPPorts = [
        53
      ];
      allowedUDPPorts = [
        53
      ];
    };
  };
}
