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
    programs.neovim.extraPackages = with pkgs; [
      marksman
      prettierd
    ];

    my.neovim.treesitterParsers = [
      "markdown"
    ];

    xdg.configFile."nvim/lua/plugins/markdown.lua".source = ./spec.lua;
  };
}
