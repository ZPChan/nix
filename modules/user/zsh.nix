{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.programs.zsh.enable {
    programs.starship.enable = lib.mkDefault true;
  };
}


