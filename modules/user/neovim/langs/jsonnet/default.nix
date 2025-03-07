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
    programs.neovim.extraPackages = with pkgs; [
      jsonnet
      jsonnet-language-server
    ];

    my.neovim.treesitterParsers = [
      "jsonnet"
    ];

    programs.jsonnet.enable = lib.mkDefault true;

    xdg.configFile."nvim/lua/plugins/jsonnet.lua".source = ./spec.lua;
  };
}
