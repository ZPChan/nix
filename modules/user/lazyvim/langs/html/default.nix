{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.lang.html.enable = lib.mkEnableOption "html";
  };
  config = lib.mkIf config.my.lang.html.enable {

    programs.lazyvim = {
      extraPackages = with pkgs; [
        vscode-langservers-extracted
        prettierd
      ];
      treesitterParsers = with pkgs.vimPlugins.nvim-treesitter.grammarPlugins; [
        html
      ];
      plugins."my.lang.html" = builtins.readFile ./spec.lua;
    };
  };
}
