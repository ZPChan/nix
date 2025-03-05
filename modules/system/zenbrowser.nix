{
  pkgs,
  lib,
  config,
  inputs,
  system,
  ...
}:
{
  options = {
    my.zenbrowser.enable = lib.mkEnableOption "enables zenbrowser module";
  };
  config = lib.mkIf config.my.zenbrowser.enable {
    environment.systemPackages = [
      inputs.zen-browser.packages."${system}".default
    ];
  };
}
