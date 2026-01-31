{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.lang.css.enable = lib.mkEnableOption "css";
  };
  config = lib.mkIf config.my.lang.css.enable {

    programs.lazyvim = {
      extraPackages = with pkgs; [
        vscode-langservers-extracted
        prettierd
      ];
      treesitterParsers = with pkgs.vimPlugins.nvim-treesitter.grammarPlugins; [
        css
      ];
      plugins."my.lang.css" = builtins.readFile ./spec.lua;
    };
  };
}
