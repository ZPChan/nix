{ pkgs, lib, config, userName, userFullName, ... }: {
  options = {
    user.enable = lib.mkEnableOption "enables user module";
  };
  config = lib.mkIf config.user.enable {
    users.users."${userName}" = {
      isNormalUser = true;
      description = "${userFullName}";
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };
}
