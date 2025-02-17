{ pkgs, lib, config, ... }: {
  options = {
    ssh.enable = lib.mkEnableOption "enables ssh module";
  };
  config = lib.mkIf config.ssh.enable {
    services.openssh.enable = true;
  };
}

