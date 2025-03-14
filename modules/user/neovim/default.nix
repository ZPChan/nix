{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./langs
  ];

  options = {
    my.neovim.enable = lib.mkEnableOption "enables neovim module";
    my.neovim.treesitterParsers = lib.mkOption {
      default = [ ];
      example = lib.literalExpression ''
        [ "nix" pkgs.vimPlugins.nvim-treesitter-parsers.yaml ]
      '';
      type =
        with lib.types;
        listOf (oneOf [
          str
          package
        ]);
    };
  };
  config = lib.mkIf config.my.neovim.enable {

    my.lang.bash.enable = lib.mkDefault true;
    my.lang.lua.enable = lib.mkDefault true;
    my.lang.nix.enable = lib.mkDefault true;

    my.neovim.treesitterParsers = [
      "csv"
      "regex"
    ];

    programs.neovim = {
      enable = lib.mkDefault true;

      defaultEditor = lib.mkDefault true;
      viAlias = lib.mkDefault true;
      vimAlias = lib.mkDefault true;
      vimdiffAlias = lib.mkDefault true;

      extraPackages = with pkgs; [
        # Telescope
        ripgrep
      ];

      plugins = with pkgs.vimPlugins; [
        lazy-nvim
      ];

      extraLuaConfig =
        let
          plugins = with pkgs.vimPlugins; [
            # LazyVim
            LazyVim
            alpha-nvim
            blink-cmp
            blink-compat
            bufferline-nvim
            cmp-buffer
            cmp-nvim-lsp
            cmp-path
            cmp_luasnip
            conform-nvim
            dashboard-nvim
            dial-nvim
            dressing-nvim
            flash-nvim
            friendly-snippets
            gitsigns-nvim
            inc-rename-nvim
            indent-blankline-nvim
            lualine-nvim
            neo-tree-nvim
            neoconf-nvim
            neodev-nvim
            noice-nvim
            nui-nvim
            nvim-cmp
            nvim-dap
            nvim-lint
            nvim-lspconfig
            nvim-notify
            nvim-spectre
            nvim-treesitter
            nvim-treesitter-context
            nvim-treesitter-textobjects
            nvim-ts-autotag
            nvim-ts-context-commentstring
            nvim-web-devicons
            persistence-nvim
            plenary-nvim
            snacks-nvim
            telescope-fzf-native-nvim
            telescope-nvim
            todo-comments-nvim
            tokyonight-nvim
            trouble-nvim
            vim-illuminate
            vim-startuptime
            which-key-nvim
            yanky-nvim

            {
              name = "LuaSnip";
              path = luasnip;
            }
            {
              name = "catppuccin";
              path = catppuccin-nvim;
            }
            {
              name = "mini.ai";
              path = mini-nvim;
            }
            {
              name = "mini.bufremove";
              path = mini-nvim;
            }
            {
              name = "mini.comment";
              path = mini-nvim;
            }
            {
              name = "mini.indentscope";
              path = mini-nvim;
            }
            {
              name = "mini.pairs";
              path = mini-nvim;
            }
            {
              name = "mini.surround";
              path = mini-nvim;
            }
            {
              name = "mini.starter";
              path = mini-nvim;
            }
            {
              name = "mini.hipatterns";
              path = mini-nvim;
            }
          ];
          mkEntryFromDrv =
            drv:
            if lib.isDerivation drv then
              {
                name = "${lib.getName drv}";
                path = drv;
              }
            else
              drv;
          lazyPath = pkgs.linkFarm "lazy-plugins" (builtins.map mkEntryFromDrv plugins);
        in
        ''
          require("lazy").setup({
            defaults = {
              lazy = true,
            },
            dev = {
              -- reuse files from pkgs.vimPlugins.*
              path = "${lazyPath}",
              patterns = { "" },
              -- fallback to download
              fallback = true,
            },
            spec = {
              { "LazyVim/LazyVim", import = "lazyvim.plugins" },
              -- The following configs are needed for fixing lazyvim on nix
              -- force enable telescope-fzf-native.nvim
              { "nvim-telescope/telescope-fzf-native.nvim", enabled = true },
              -- disable mason.nvim, use programs.neovim.extraPackages
              { "williamboman/mason-lspconfig.nvim", enabled = false },
              { "williamboman/mason.nvim", enabled = false },
              -- import/override with your plugins
              { import = "plugins" },
              -- treesitter handled by xdg.configFile."nvim/parser", put this line at the end of spec to clear ensure_installed
              { "nvim-treesitter/nvim-treesitter",
                opts = function(_, opts)
                  opts.ensure_installed = {}
                end
              },
            },
          })
        '';
    };

    home.file = {
      ".config/nvim/lua/config" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix/dotfiles/nvim/lua/config";
      };
      ".config/nvim/lua/plugins/colorscheme.lua" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix/dotfiles/nvim/lua/plugins/colorscheme.lua";
      };
    };
    xdg.configFile."nvim/parser".source =
      let
        parserStrings = builtins.filter builtins.isString config.my.neovim.treesitterParsers;
        parserPackages = builtins.filter lib.isDerivation config.my.neovim.treesitterParsers;
        parsers = pkgs.symlinkJoin {
          name = "treesitter-parsers";
          paths =
            (pkgs.vimPlugins.nvim-treesitter.withPlugins (
              plugins: lib.attrVals parserStrings plugins ++ parserPackages
            )).dependencies;
        };
      in
      "${parsers}/parser";
  };
}
