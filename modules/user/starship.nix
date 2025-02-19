{ pkgs, lib, config, ... }: {
  options = {
    starship.enable = lib.mkEnableOption "enables starship module";
  };
  config = lib.mkIf config.starship.enable {
    programs.starship = {
      enable = true;
      enableZshIntegration = true;
    };
    home.file = {
      ".config/starship.toml" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix/dotfiles/starship/starship.toml";
      };
    };
  };
}

