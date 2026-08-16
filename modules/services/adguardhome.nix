{ inputs, ... }:
{
  flake.modules.nixos.adguardhome =
    {
      modulesPath,
      lib,
      ...
    }:
    {
      imports = with inputs.self.modules.nixos; [
        (modulesPath + "/virtualisation/qemu-vm.nix")
        arion
      ];

      virtualisation.qemu.networkingOptions = lib.mkForce [
        "-device e1000,netdev=net0"
        "-netdev user,id=net0,hostfwd=tcp:127.0.0.1:3010-:3000,\${QEMU_NET_OPTS:+,$QEMU_NET_OPTS}"
      ];

      networking.firewall.allowedTCPPorts = [
        3010
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
