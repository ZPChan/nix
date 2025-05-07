{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.lang.nu.enable = lib.mkEnableOption "nu";
  };
  config = lib.mkIf config.my.lang.nu.enable {

    programs.lazyvim = {
      pluginsFile."my.lang.nu.lua".source = ./spec.lua;
    };

    my.lazyvim.treesitterParsers = [
      "nu"
    ];
  };
}
