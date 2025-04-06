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
      pluginsFile."my.lang.json.lua".source = ./spec.lua;
    };

    programs.neovim.extraPackages = with pkgs; [
      vscode-langservers-extracted
      prettierd
    ];

    my.lazyvim.treesitterParsers = [
      "json"
      "jsonc"
    ];

    programs.jq.enable = lib.mkDefault true;
  };
}
