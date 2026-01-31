{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.lang.jinja.enable = lib.mkEnableOption "jinja";
  };
  config = lib.mkIf config.my.lang.jinja.enable {

    programs.lazyvim = {
      extraPackages = with pkgs; [
        jinja-lsp
        djlint
      ];
      treesitterParsers = with pkgs.vimPlugins.nvim-treesitter.grammarPlugins; [
        jinja
      ];
      plugins."my.lang.jinja" = builtins.readFile ./spec.lua;
    };
  };
}
