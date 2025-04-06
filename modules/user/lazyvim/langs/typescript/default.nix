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
    programs.lazyvim = {
      extras.lang.typescript.enable = lib.mkDefault true;
      pluginsFile."my.lang.typescript.lua".source = ./spec.lua;
    };

    programs.neovim.extraPackages = with pkgs; [
      typescript-language-server
      prettierd
    ];

    my.lazyvim.treesitterParsers = [
      "typescript"
    ];
  };
}
