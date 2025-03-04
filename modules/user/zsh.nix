{
  pkgs,
  lib,
  config,
  ...
}:
{
  config = lib.mkIf config.programs.zsh.enable {
    programs.starship.enable = lib.mkDefault true;
    programs.zsh = {
      autosuggestion.enable = true;
      antidote = {
        enable = true;
        plugins = [
          "zsh-users/zsh-syntax-highlighting"
          "zsh-users/zsh-autosuggestions"
          "zsh-users/zsh-history-substring-search"
        ];
      };
    };
  };
}
