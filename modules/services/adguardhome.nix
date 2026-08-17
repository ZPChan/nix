{
  flake.modules.nixos.adguardhome = {
    networking.firewall = {
      enable = true;
      allowedTCPPorts = [
        53
        8053
        443
        8443
        3000
        8080
      ];
      allowedUDPPorts = [
        53
        8053
        443
        8443
      ];
    };
  };
}
