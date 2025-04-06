{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.lang.jsonnet.enable = lib.mkEnableOption "jsonnet";
  };
  config = lib.mkIf config.my.lang.jsonnet.enable {

    programs.lazyvim = {
      pluginsFile."my.lang.jsonnet.lua".source = ./spec.lua;
    };

    programs.neovim.extraPackages = with pkgs; [
      jsonnet
      jsonnet-language-server
    ];

    my.lazyvim.treesitterParsers = [
      "jsonnet"
    ];

    home.packages = with pkgs; [
      jsonnet
    ];
  };
}
