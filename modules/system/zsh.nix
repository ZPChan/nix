{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.zsh.enable = lib.mkEnableOption "enables zsh module";
    my.zsh.defaultShell = lib.mkEnableOption "makes zsh default shell";
  };
  config = lib.mkMerge [
    (lib.mkIf config.my.zsh.enable {
      programs.zsh.enable = true;
      environment.systemPackages = with pkgs; [
        zsh
      ];
      environment.pathsToLink = [ "/share/zsh" ];
    })
    (lib.mkIf config.my.zsh.defaultShell {
      users.users."${config.my.user.userName}".shell = pkgs.zsh;
      programs.tmux.extraConfig = ''
        set-option -g default-shell ${pkgs.zsh}/bin/zsh
      '';
    })
  ];
}
