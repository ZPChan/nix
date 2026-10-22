{
  flake.modules.nixos.superfile =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        superfile
      ];
    };

  flake.modules.homeManager.superfile = {
    home.file.".config/superfile/config.toml".source = ./config.toml;
    home.file.".config/superfile/hotkeys.toml".source = ./hotkeys.toml;
  };
}
