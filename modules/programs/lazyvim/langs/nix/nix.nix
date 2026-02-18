{
  flake.modules.homeManager.nix-lang =
    { pkgs, ... }:
    {

      programs.lazyvim = {
        extras.lang.nix.enable = true;
        extraPackages = with pkgs; [
          nixd
          nixfmt
        ];
        treesitterParsers = with pkgs.vimPlugins.nvim-treesitter-parsers; [
          nix
        ];
        plugins."my.lang.nix" = builtins.readFile ./spec.lua;
      };
    };
}
