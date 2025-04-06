{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.lang.javascript.enable = lib.mkEnableOption "javascript";
  };
  config = lib.mkIf config.my.lang.javascript.enable {

    programs.lazyvim = {
      pluginsFile."my.lang.javascript.lua".source = ./spec.lua;
    };

    programs.neovim.extraPackages = with pkgs; [
      typescript-language-server
      prettierd
    ];

    my.neovim.treesitterParsers = [
      "javascript"
    ];
  };
}
