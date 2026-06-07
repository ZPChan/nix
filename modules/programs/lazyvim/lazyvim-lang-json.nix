{
  flake.modules.homeManager.lazyvim-lang-json =
    { pkgs, ... }:
    {
      programs.lazyvim = {
        extras.lang.json = {
          enable = true;
          installDependencies = true;
        };
        treesitterParsers = with pkgs.vimPlugins.nvim-treesitter.grammarPlugins; [
          json
        ];
      };
    };
}
