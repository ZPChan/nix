{ inputs, ... }:
{
  flake-file.inputs = {
    arion.url = "github:hercules-ci/arion";
  };

  flake.modules.nixos.arion =
    { pkgs, ... }:
    {
      imports = [
        inputs.arion.nixosModules.arion
        inputs.self.modules.nixos.podman
      ];

      environment.systemPackages = with pkgs; [
        arion
        docker-client
      ];
      virtualisation.arion = {
        backend = "podman-socket";
      };
    };
}
