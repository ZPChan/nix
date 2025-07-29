{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.lang.jinja.enable = lib.mkEnableOption "jinja";
  };
  config = lib.mkIf config.my.lang.jinja.enable {

    programs.lazyvim = {
      pluginsFile."my.lang.jinja.lua".source = ./spec.lua;
    };

    programs.neovim.extraPackages = with pkgs; [
      jinja-lsp
      djlint
    ];

    my.lazyvim.treesitterParsers = [
      "jinja"
    ];
  };
}
