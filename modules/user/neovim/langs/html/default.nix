{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.lang.html.enable = lib.mkEnableOption "html";
  };
  config = lib.mkIf config.my.lang.html.enable {
    programs.neovim.extraPackages = with pkgs; [
      vscode-langservers-extracted
      prettierd
    ];

    my.neovim.treesitterParsers = [
      "html"
    ];

    xdg.configFile."nvim/lua/plugins/html.lua".source = ./spec.lua;
  };
}
