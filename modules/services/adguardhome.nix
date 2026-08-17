{
  flake.modules.nixos.adguardhome = {
    services.adguardhome = {
      enable = true;
      host = "127.0.0.1";
      port = 3000;
      openFirewall = true;
      settings = { };
    };
  };
}
