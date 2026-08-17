{
  flake.modules.nixos.adguardhome = {
    services.adguardhome = {
      enable = true;
      openFirewall = true;
    };
  };
}
