{
  flake.modules.homeManager.jsonnet-lang =
    { pkgs, ... }:
    {

      programs.lazyvim = {
        extraPackages = with pkgs; [
          jsonnet
          jsonnet-language-server
        ];
        treesitterParsers = with pkgs.vimPlugins.nvim-treesitter.grammarPlugins; [
          jsonnet
        ];
        plugins."my.lang.jsonnet" = builtins.readFile ./spec.lua;
      };

      home.packages = with pkgs; [
        jsonnet
      ];
    };
}
