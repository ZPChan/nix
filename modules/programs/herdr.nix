{
  flake.modules.nixos.herdr-core =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        herdr-core
      ];
    };

  flake.modules.homeManager.herdr = {
    programs.herdr = {
      enable = true;
    };
  };
}
