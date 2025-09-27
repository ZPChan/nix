{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.mdns.resolution.enable = lib.mkEnableOption "enables mdns resolution";
    my.mdns.publishing.enable = lib.mkEnableOption "enables mdns publishing";
  };
  config = lib.mkMerge [
    (lib.mkIf config.my.mdns.resolution.enable {
      services.avahi = {
        enable = true;
        nssmdns4 = true;
      };
    })
    (lib.mkIf config.my.mdns.publishing.enable {
      services.avahi = {
        enable = true;
        nssmdns4 = true;
        publish = {
          enable = true;
          addresses = true;
        };
      };
    })
  ];
}
