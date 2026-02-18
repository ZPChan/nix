{
  flake.modules.homeManager.yaml-lang =
    { pkgs, ... }:
    {
      programs.lazyvim = {
        extras.lang.yaml= {
          enable = true; 
          installDependencies = true;
        };
        treesitterParsers = with pkgs.vimPlugins.nvim-treesitter.grammarPlugins; [
          yaml
        ];
      };
    };
}
