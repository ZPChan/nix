{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
{
  options = {
    my.autogc.enable = lib.mkEnableOption "enables auto garbage collection";
  };
  config = lib.mkIf config.my.autogc.enable {
    nix.gc = {
      automatic = true;
      randomizedDelaySec = "14m";
      options = "--delete-older-than 10d";
    };
  };
}
