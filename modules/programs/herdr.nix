{
  flake.modules.nixos.herdr-core =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        herdr-core
      ];
    };

  flake.modules.homeManager.herdr-desktop =
    {pkgs, ...}:
    {
      home.packages = with pkgs; [
        herdr-desktop
      ];
    };

  flake.modules.homeManager.herdr = {
    programs.herdr = {
      enable = true;
    };
  };
}
