{
  flake.modules.nixos.wake-on-lan =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        wakeonlan
      ];
    };
}
