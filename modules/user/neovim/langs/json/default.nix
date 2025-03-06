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
    programs.neovim.extraPackages = with pkgs; [
      vscode-langservers-extracted
      prettierd
    ];

    my.neovim.treesitterParsers = [
      "json"
      "jsonc"
    ];

    programs.jq.enable = lib.mkDefault true;

    xdg.configFile."nvim/lua/plugins/json.lua".source = ./spec.lua;
  };
}
