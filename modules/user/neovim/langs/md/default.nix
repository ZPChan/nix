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

    ];

    my.neovim.treesitterParsers = [
      "md"
    ];
  };
}
