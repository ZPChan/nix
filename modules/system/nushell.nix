{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.nushell.enable = lib.mkEnableOption "enables nushell module";
  };
  config = lib.mkIf config.my.nushell.enable {

    users.users."${config.my.user.userName}".shell = pkgs.nushell;

    environment.systemPackages = with pkgs; [
      nushell
    ];

    programs.tmux.extraConfig = ''
      set-option -g default-shell ${pkgs.nushell}/bin/nu
    '';
  };
}
