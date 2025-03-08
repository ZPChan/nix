{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.lang.typescript.enable = lib.mkEnableOption "typescript";
  };
  config = lib.mkIf config.my.lang.typescript.enable {
    programs.neovim.extraPackages = with pkgs; [
      typescript-language-server
      prettierd
    ];

    my.neovim.treesitterParsers = [
      "typescript"
    ];

    xdg.configFile."nvim/lua/plugins/typescript.lua".source = ./spec.lua;
  };
}
