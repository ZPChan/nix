{ pkgs, lib, config, osConfig, ... }: {
  options = {
    user.enable = lib.mkEnableOption "enables user module";
  };
  config = lib.mkIf config.user.enable {
    users.users."${osConfig.userName}" = {
      isNormalUser = true;
      description = "${osConfig.userFullName}";
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };
}
