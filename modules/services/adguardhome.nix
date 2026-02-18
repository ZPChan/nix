{ inputs, ... }:
{
  flake-file.inputs = {
    arion.url = "github:hercules-ci/arion";
  };

  flake.modules.nixos.adguardhome = {
    imports = [
      inputs.arion.nixosModules.arion
    ];

    virtualisation.arion = {
      backend = "docker";
      projects.adguardhome.settings.services.adguardhome.service = {
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
}
