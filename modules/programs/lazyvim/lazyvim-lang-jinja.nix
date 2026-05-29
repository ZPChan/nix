{
  flake.modules.homeManager.lazyvim-lang-jinja =
    { pkgs, ... }:
    {
      programs.lazyvim = {
        extras.lang.nix = {
          enable = true;
          config = ''
            return {
              {
                "neovim/nvim-lspconfig",
                opts = {
                  servers = {
                    nixd = {},
                  },
                },
              },
            }
          '';
        };

        extraPackages = with pkgs; [
          jinja-lsp
          djlint
        ];
        treesitterParsers = with pkgs.vimPlugins.nvim-treesitter.grammarPlugins; [
          jinja
        ];
        plugins."my.lang.jinja" = ''
          return {
            {
              "neovim/nvim-lspconfig",
              opts = {
                servers = {
                  jinja_lsp = {
                    filetypes = { "jinja" },
                  },
                },
              },
            },
            {
              "stevearc/conform.nvim",
              opts = {
                formatters_by_ft = {
                  jinja = { "djlint" },
                },
              },
            },
          }
        '';
      };
    };
}
