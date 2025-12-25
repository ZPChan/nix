{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.docker.adguardhome.enable = lib.mkEnableOption "enables adguardhome container";
  };
  config = lib.mkIf config.my.docker.adguardhome.enable {
    my.docker.enable = lib.mkDefault true;
    services.adguardhome = {
      service.image = "adguard/adguardhome";
      service.volumes = [
        "/var/containers/adguardhome/work:/opt/adguardhome/work"
        "/var/containers/adguardhome/conf:/opt/adguardhome/conf"
      ];
      service.ports = [
        "53:53/tcp"
        "53:53/udp"
        "80:80/tcp"
        "443:443/tcp"
        "443:443/udp"
        "3000:3000/tcp"
        "853:853/tcp"
      ];
    };
  };
}
