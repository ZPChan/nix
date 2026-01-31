{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.lang.nix.enable = lib.mkEnableOption "nix";
  };
  config = lib.mkIf config.my.lang.nix.enable {

    programs.lazyvim = {
      extras.lang.nix = {
        enable = lib.mkDefault true;
      };
      extraPackages = with pkgs; [
        nixd
        nixfmt
      ];
      treesitterParsers = with pkgs.vimPlugins.nvim-treesitter.grammarPlugins; [
        nix
      ];
      plugins."my.lang.nix" = builtins.readFile ./spec.lua;
    };
  };
}
