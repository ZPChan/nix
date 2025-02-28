{ pkgs, lib, config, ... }: {
  options = {
    user.enable = lib.mkEnableOption "enables user module";
    user.userName = lib.mkOption { type = lib.types.str; };
    user.userFullName = lib.mkOption { type = lib.types.str; };
  };
  config = lib.mkIf config.user.enable {
    users.users."${config.user.userName}" = {
      isNormalUser = true;
      description = "${config.user.userFullName}";
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };
}
