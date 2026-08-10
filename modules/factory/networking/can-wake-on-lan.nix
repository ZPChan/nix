{
  config.flake.factory.networking.can-wake-on-lan = device: {
    nixos."can-wake-on-lan-${device}" = {
      networking = {
        interfaces."${device}" = {
          wakeOnLan.enable = true;
        };
        firewall = {
          allowedUDPPorts = [ 9 ];
        };
      };
    };
  };
}
