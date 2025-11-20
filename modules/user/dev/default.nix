{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.dev.enable = lib.mkEnableOption "dev";
  };
  config = lib.mkIf config.my.dev.enable {
    home.file = {
      ".config/yazi/theme.toml" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix/dotfiles/yazi/theme.toml";
      };
    };
  };
}
