{ pkgs, lib, config, ... }: {
  options = {
    services.ssh.enable = lib.mkEnableOption "enables ssh module";
  };
  config = lib.mkIf config.services.ssh.enable {
    services.openssh.enable = true;
  };
}

