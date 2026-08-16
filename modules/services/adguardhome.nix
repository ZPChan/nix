{ inputs, ... }:
{
  flake.modules.nixos.adguardhome = {
    imports = with inputs.self.modules.nixos; [
      arion
    ];
    virtualisation.arion = {
      projects.adguardhome = {
        serviceName = "adguardhome";
        settings = {
          project.name = "adguardhome";
          services = {
            adguardhome.service = {
              image = "adguard/adguardhome";
              restart = "unless-stopped";
              volumes = [
                "/var/containers/adguardhome/work:/opt/adguardhome/work"
                "/var/containers/adguardhome/conf:/opt/adguardhome/conf"
              ];
              ports = [
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
        };
      };
    };
  };
}
