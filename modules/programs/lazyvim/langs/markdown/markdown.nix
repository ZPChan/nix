{
  flake.modules.homeManager.markdown-lang =
    { pkgs, ... }:
    {

      programs.lazyvim = {
        extras.lang.markdown.enable = true;
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
