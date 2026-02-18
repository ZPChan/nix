{
  flake.modules.nixos.yazi =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        yazi
      ];
    };

  flake.modules.homeManager.yazi = {
    home.file.".config/yazi/theme.toml".source = ./yazi.theme.toml;
  };

}
