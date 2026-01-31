{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.lang.javascript.enable = lib.mkEnableOption "javascript";
  };
  config = lib.mkIf config.my.lang.javascript.enable {

    programs.lazyvim = {
      extraPackages = with pkgs; [
        typescript-language-server
        prettierd
      ];
      treesitterParsers = with pkgs.vimPlugins.nvim-treesitter.grammarPlugins; [
        javascript
      ];
      plugins."my.lang.javascript" = builtins.readFile ./spec.lua;
    };
  };
}
