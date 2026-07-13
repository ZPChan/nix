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
      ];

      environment.systemPackages = with pkgs; [
        arion
      ];
    };
}
