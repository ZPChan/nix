{
  flake.modules.homeManager.bash-lang =
    { pkgs, ... }:
    {
      programs.lazyvim = {
        extraPackages = with pkgs; [
          bash-language-server
          shellcheck
          shfmt
        ];
        treesitterParsers = with pkgs.vimPlugins.nvim-treesitter.grammarPlugins; [
          bash
        ];
        plugins."my.lang.bash" = builtins.readFile ./spec.lua;
      };
    };
}
