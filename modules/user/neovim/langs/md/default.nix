{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.lang.md.enable = lib.mkEnableOption "md";
  };
  config = lib.mkIf config.my.lang.md.enable {
    programs.neovim.extraPackages = with pkgs; [
      marksman
      prettierd
    ];

    my.neovim.treesitterParsers = [
      "md"
    ];

    xdg.configFile."nvim/lua/plugins/md.lua".source = ./spec.lua;
  };
}
