{
  flake.modules.nixos.brightnessctl =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        brightnessctl
      ];
    };
}
