{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.programs.zsh.enable {
    programs.starship.enable = lib.mkDefault true;
    programs.zsh = {
      autosuggestion.enable = true;
    };
    environment.pathsToLink = [ "/share/zsh"];
  };
}


