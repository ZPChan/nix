{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.lang.markdown.enable = lib.mkEnableOption "markdown";
  };
  config = lib.mkIf config.my.lang.markdown.enable {

    programs.lazyvim = {
      extras.lang.markdown.enable = lib.mkDefault true;
      extraPackages = with pkgs; [
        marksman
        prettierd
      ];
      treesitterParsers = with pkgs.vimPlugins.nvim-treesitter.grammarPlugins; [
        markdown
      ];
      plugins."my.lang.markdown" = builtins.readFile ./spec.lua;
    };
  };
}
