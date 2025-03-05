{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.zsh.enable = lib.mkEnableOption "enables zsh module";
  };
  config = lib.mkIf config.my.zsh.enable {
    programs.zsh = {
      enable = true;
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
