{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.lang.css.enable = lib.mkEnableOption "css";
  };
  config = lib.mkIf config.my.lang.css.enable {

    programs.lazyvim = {
      pluginsFile."my.lang.css.lua".source = ./spec.lua;
    };

    programs.neovim.extraPackages = with pkgs; [
      vscode-langservers-extracted
      prettierd
    ];

    my.lazyvim.treesitterParsers = [
      "css"
    ];
  };
}
