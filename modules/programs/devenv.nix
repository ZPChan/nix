{
  flake.modules.nixos.devenv =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        devenv
      ];
    };
}
