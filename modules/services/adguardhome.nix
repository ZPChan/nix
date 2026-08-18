{
  flake.modules.nixos.adguardhome = {
    services.adguardhome = {
      enable = true;
      openFirewall = true;
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
