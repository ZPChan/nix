{
  flake.modules.homeManager.css-lang =
    { pkgs, ... }:
    {

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
