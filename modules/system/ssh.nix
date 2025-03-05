{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.ssh.enable = lib.mkEnableOption "enables ssh module";
  };
  config = lib.mkIf config.my.ssh.enable {
    services.openssh.enable = true;
  };
}
