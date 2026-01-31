{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.lang.json.enable = lib.mkEnableOption "json";
  };
  config = lib.mkIf config.my.lang.json.enable {

    programs.lazyvim = {
      extras.lang.json.enable = lib.mkDefault true;
      extraPackages = with pkgs; [
        vscode-langservers-extracted
        prettierd
      ];
      treesitterParsers = with pkgs.vimPlugins.nvim-treesitter.grammarPlugins; [
        json
      ];
      plugins."my.lang.json" = builtins.readFile ./spec.lua;
    };

    programs.jq.enable = lib.mkDefault true;
  };
}
