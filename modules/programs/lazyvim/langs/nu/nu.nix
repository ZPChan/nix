{
  flake.modules.homeManager.nu-lang =
    { pkgs, ... }:
    {

      programs.lazyvim = {
        extras.lang.nushell.enable = true;
        treesitterParsers = with pkgs.vimPlugins.nvim-treesitter.grammarPlugins; [
          nu
        ];
        plugins."my.lang.nushell" = builtins.readFile ./spec.lua;
      };
    };
}
