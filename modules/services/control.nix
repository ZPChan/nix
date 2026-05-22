{
  flake.modules.nixos.control =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
      	better-control
      ];
    };
}

