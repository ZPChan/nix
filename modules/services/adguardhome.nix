{
  flake.modules.nixos.adguardhome = {
    networking.firewall = {
      allowedTCPPorts = [
        53
        443
        3000
        8000
        853
      ];
      allowedUDPPorts = [
        53
        443
      ];
    };
  };
}
