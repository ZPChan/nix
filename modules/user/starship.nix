{
  pkgs,
  lib,
  config,
  ...
}:
{
  config = lib.mkIf config.programs.starship.enable {
    programs.starship = {
      enableZshIntegration = true;
    };
    home.file = {
      ".config/starship.toml" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix/dotfiles/starship/starship.toml";
      };
    };
  };
}
