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

    programs.lazyvim = {
      pluginsFile."my.lang.html.lua".source = ./spec.lua;
    };

    programs.neovim.extraPackages = with pkgs; [
      vscode-langservers-extracted
      prettierd
    ];

    my.neovim.treesitterParsers = [
      "html"
    ];
  };
}
