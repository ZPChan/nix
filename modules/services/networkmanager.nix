{
  flake.modules.nixos.networkmanager =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        networkmanagerapplet
      ];
      networking = {
        networkmanager.enable = true;
      };
    };
}
