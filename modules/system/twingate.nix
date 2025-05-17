{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.twingate.enable = lib.mkEnableOption "twingate";
  };
  config = lib.mkIf config.my.twingate.enable {
    environment.systemPackages = with pkgs; [
      twingate
    ];
    services.twingate.enable = true;
  };
}
