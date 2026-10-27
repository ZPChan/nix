{
  flake.modules.nixos.azure-cli =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        # azure-cli
      ];
    };
}
