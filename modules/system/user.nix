{ pkgs, lib, config, ... }: {
  options = {
    user.enable = lib.mkEnableOption "enables user module";
  };
  config = lib.mkIf config.user.enable {
    users.users.zach = {
      isNormalUser = true;
      description = "Zach Putman";
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };
}
