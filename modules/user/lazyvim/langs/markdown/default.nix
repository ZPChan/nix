{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.lang.markdown.enable = lib.mkEnableOption "markdown";
  };
  config = lib.mkIf config.my.lang.markdown.enable {

    programs.lazyvim = {
      extras.lang.markdown.enable = lib.mkDefault true;
      pluginsFile."my.lang.markdown.lua".source = ./spec.lua;
    };

    programs.neovim.extraPackages = with pkgs; [
      marksman
      prettierd
    ];

    my.lazyvim.treesitterParsers = [
      "markdown"
    ];
  };
}
