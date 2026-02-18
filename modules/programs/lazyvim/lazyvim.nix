{
  inputs,
  ...
}:
{
  flake-file.inputs = {
    lazyvim = {
      url = "github:pfassina/lazyvim-nix";
      inputs.nixpkgs.follows = "latest";
    };
  };

  flake.modules.homeManager.lazyvim =
    { pkgs, ... }:
    {
      imports =
        with inputs.self.modules.homeManager;
        [
          bash-lang
          css-lang
          html-lang
          javascript-lang
          json-lang
          lua-lang
          markdown-lang
          nix-lang
          nu-lang
          typescript-lang
          yaml-lang
        ]
        ++ (with inputs.lazyvim.homeManagerModules; [
          default
        ]);

      programs.lazyvim = {
        enable = true;
        pluginSource = "latest";
        extras = {
          coding = {
            yanky.enable = true;
            mini_surround.enable = true;
          };
          editor = {
            dial.enable = true;
            inc_rename.enable = true;
          };
          test = {
            core.enable = true;
          };
          util = {
            dot.enable = true;
            mini_hipatterns.enable = true;
          };
        };
        plugins.colorscheme = ''
          return {
            {
              "LazyVim/LazyVim",
              opts = {
                colorscheme = "catppuccin",
              },
            },
          }
        '';
      };
      programs.neovim.plugins = [
        pkgs.vimPlugins.nvim-treesitter
      ];
    };
}
