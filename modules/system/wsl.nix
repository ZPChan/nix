{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.wsl = {
      enable = lib.mkEnableOption "wsl";
      userName = lib.mkOption { type = lib.types.str; };
    };
  };
  config = lib.mkIf config.my.wsl.enable {
    wsl = {
      enable = true;
      defaultUser = "${config.my.wsl.userName}";

      docker-desktop.enable = false;

      extraBin = with pkgs; [
        { src = "${coreutils}/bin/mkdir"; }
        { src = "${coreutils}/bin/cat"; }
        { src = "${coreutils}/bin/whoami"; }
        { src = "${coreutils}/bin/ls"; }
        { src = "${busybox}/bin/addgroup"; }
        { src = "${su}/bin/groupadd"; }
        { src = "${su}/bin/usermod"; }
      ];
    };

    virtualisation.docker = {
      enable = true;
      enableOnBoot = true;
      autoPrune.enable = true;
    };

    systemd.services.docker-desktop-proxy.script = lib.mkForce ''${config.wsl.wslConf.automount.root}/wsl/docker-desktop/docker-desktop-user-distro proxy --docker-desktop-root ${config.wsl.wslConf.automount.root}/wsl/docker-desktop "C:\Program Files\Docker\Docker\resources"'';
  };
}
