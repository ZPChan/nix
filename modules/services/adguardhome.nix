{
  flake.modules.nixos.adguardhome = {
    systemd.services."podman-adguardhome" = {
      serviceConfig = {
        AmbientCapabilities = "cap_net_bind_service";
        CapabilityBoundingSet = "cap_net_bind_service";
      };
    };
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
