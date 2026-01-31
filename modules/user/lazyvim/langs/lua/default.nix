{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.lang.lua.enable = lib.mkEnableOption "lua";
  };
  config = lib.mkIf config.my.lang.lua.enable {

    programs.lazyvim = {
      extraPackages = with pkgs; [
        lua-language-server
        stylua
      ];
      treesitterParsers = with pkgs.vimPlugins.nvim-treesitter.grammarPlugins; [
        lua
      ];
    };
  };
}
