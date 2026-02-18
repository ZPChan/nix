{
  flake.modules.homeManager.json-lang =
    { pkgs, ... }:
    {

      programs.lazyvim = {
        extras.lang.json.enable = true;
        extraPackages = with pkgs; [
          vscode-langservers-extracted
          prettierd
        ];
        treesitterParsers = with pkgs.vimPlugins.nvim-treesitter-parsers; [
          json
        ];
        plugins."my.lang.json" = builtins.readFile ./spec.lua;
      };

      programs.jq.enable = true;
    };
}
