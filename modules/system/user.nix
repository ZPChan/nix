{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.user.enable = lib.mkEnableOption "enables user module";
    my.user.userName = lib.mkOption { type = lib.types.str; };
    my.user.userFullName = lib.mkOption { type = lib.types.str; };
  };
  config = lib.mkIf config.my.user.enable {
    users.users."${config.my.user.userName}" = {
      isNormalUser = true;
      description = "${config.my.user.userFullName}";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };
  };
}
