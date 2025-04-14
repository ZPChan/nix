{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.nushell.enable = lib.mkEnableOption "enables nushell module";
    my.nushell.defaultShell = lib.mkEnableOption "sets nushell as default shell";
  };
  config = lib.mkMerge [
    (lib.mkIf config.my.nushell.enable {
      environment.systemPackages = with pkgs; [
        nushell
      ];
    })
    (lib.mkIf config.my.nushell.defaultShell {
      users.users."${config.my.user.userName}".shell = pkgs.nushell;
      programs.tmux.extraConfig = ''
        set-option -g default-shell ${pkgs.nushell}/bin/nu
      '';
    })
  ];
}
