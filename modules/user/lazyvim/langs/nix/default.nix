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
      extras.lang.nix.enable = lib.mkDefault true;
      pluginsFile."my.lang.nix.lua".source = ./spec.lua;
    };

    programs.neovim.extraPackages = with pkgs; [
      nixd
      nixfmt-rfc-style
    ];

  };
}
