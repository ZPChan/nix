{
  flake.modules.homeManager.html-lang =
    { pkgs, ... }:
    {

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
