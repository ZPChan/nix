{
  flake.modules.nixos.nextcloud =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        nextcloud-client
      ];
  };
}

