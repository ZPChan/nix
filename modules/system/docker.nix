{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.docker.enable = lib.mkEnableOption "enables docker module";
  };
  config = lib.mkIf config.my.docker.enable {
    environment.systemPackages = [
      pkgs.arion
    ];
    virtualisation.docker.enable = true;
    users.users."${config.my.user.userName}" = {
      extraGroups = [
        "docker"
      ];
    };
  };
}
