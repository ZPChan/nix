{
  flake.modules.nixos.adguardhome = {
    networking.firewall = {
      allowedTCPPorts = [
        53
        5300
        443
        4430
        3000
        8000
        853
        8530
      ];
      allowedUDPPorts = [
        53
        5300
        443
        4430
      ];
    };
  };
}
