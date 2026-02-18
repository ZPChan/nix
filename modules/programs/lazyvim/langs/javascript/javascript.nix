{
  flake.modules.homeManager.javascript-lang =
    { pkgs, ... }:
    {

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
