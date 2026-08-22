{
  flake.modules.nixos.sops =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        sops
        age
      ];
    };
}
