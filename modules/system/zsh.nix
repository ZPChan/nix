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

    programs.zsh.enable = true;

    users.users."${config.user.userName}".shell = pkgs.zsh;

    environment.systemPackages = with pkgs; [
      zsh
    ];

    environment.pathsToLink = [ "/share/zsh" ];
  };
}
