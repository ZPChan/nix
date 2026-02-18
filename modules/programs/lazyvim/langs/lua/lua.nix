{
  flake.modules.homeManager.lua-lang =
    { pkgs, ... }:
    {

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
