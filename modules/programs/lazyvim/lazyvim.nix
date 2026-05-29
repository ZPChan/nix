{ inputs, ... }:
{
  flake-file.inputs = {
    lazyvim.url = "github:pfassina/lazyvim-nix";
  };

  flake.modules.homeManager.lazyvim = {
    imports = [
      inputs.lazyvim.homeManagerModules.default
    ]
    ++ (with inputs.self.modules.homeManager; [
      lazyvim-lang-nix
    ]);

    programs.lazyvim = {
      enable = true;

      extras = {
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
  };
}
