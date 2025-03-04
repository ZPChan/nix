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
    ];

    my.neovim.treesitterParsers = [
      "json"
      "jsonc"
    ];
  };
}
