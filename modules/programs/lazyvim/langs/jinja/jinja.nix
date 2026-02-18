{
  flake.modules.homeManager.jinja-lang =
    { pkgs, ... }:
    {

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
