{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.lang.nu.enable = lib.mkEnableOption "nu";
  };
  config = lib.mkIf config.my.lang.nu.enable {

    programs.lazyvim = {
      extras.lang.nushell.enable = lib.mkDefault true;
      treesitterParsers = with pkgs.vimPlugins.nvim-treesitter.grammarPlugins; [
        nu
      ];
      plugins."my.lang.nushell" = builtins.readFile ./spec.lua;
    };
  };
}
