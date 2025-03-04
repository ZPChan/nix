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
      nodePackages.vscode-json-languageserver
      jq
    ];

    my.neovim.treesitterParsers = [
      "json"
      "jsonc"
    ];
  };
}
