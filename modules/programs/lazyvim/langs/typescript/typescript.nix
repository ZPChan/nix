{
  flake.modules.homeManager.typescript-lang =
    { pkgs, ... }:
    {
      programs.lazyvim = {
        extras.lang.typescript.enable = true;
        extraPackages = with pkgs; [
          typescript-language-server
          prettierd
        ];
        treesitterParsers = with pkgs.vimPlugins.nvim-treesitter.grammarPlugins; [
          typescript
        ];
        plugins."my.lang.typescript" = builtins.readFile ./spec.lua;
      };
    };
}
