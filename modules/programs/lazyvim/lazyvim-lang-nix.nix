{
  flake.modules.homeManager.lazyvim-lang-nix =
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
          nixd
          nixfmt
          statix
        ];
      };
    };
}
