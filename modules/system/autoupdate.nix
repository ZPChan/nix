{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
{
  options = {
    my.autoupdate.enable = lib.mkEnableOption "enables autoupdate module";
  };
  config = lib.mkIf config.my.autoupdate.enable {
    my.autogc.enable = lib.mkDefault true;
    system.autoUpgrade = {
      enable = true;
      flake = inputs.self.outPath;
      flags = [
        "--print-build-logs"
      ];
      dates = "02:00";
      randomizedDelaySec = "45min";
    };
  };
}
