{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.mdns.enable = lib.mkEnableOption "enables mdns module";
    my.mdns.publish = lib.mkEnableOption "enables mdns publishing";
  };
  config = lib.mkIf config.my.mdns.enable {
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      publish = {
        enable = config.my.mdns.publish;
        addresses = true;
      };
    };
  };
}
