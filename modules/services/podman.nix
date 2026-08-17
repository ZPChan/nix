{
  flake.modules.nixos.podman =
    { pkgs, config, ... }:
    {

      environment.systemPackages = with pkgs; [
        podman-compose
      ];

      virtualisation = {
        oci-containers.backend = "podman";
        podman = {
          enable = true;
          autoPrune.enable = true;
          dockerCompat = true;
          defaultNetwork.settings.dns_enabled = true;
        };
      };
      networking.firewall.interfaces =
        let
          matchAll = if !config.networking.nftables.enable then "podman+" else "podman*";
        in
        {
          "${matchAll}".allowedUDPPorts = [ 53 ];
        };
    };
}
