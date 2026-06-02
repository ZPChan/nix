{
  flake.modules.homeManager.lazyvim-lang-html =
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
        plugins."my.lang.html" = ''
          return {
            {
              "neovim/nvim-lspconfig",
              opts = {
                servers = {
                  html = {},
                },
              },
            },
            {
              "stevearc/conform.nvim",
              opts = {
                formatters_by_ft = {
                  html = { "prettierd" },
                  htm = { "prettierd" },
                },
              },
            },
          }
        '';
      };
    };
}
