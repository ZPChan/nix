{ pkgs, lib, config, ... }: {
  options = {
    my.lang.nix.enable = lib.mkEnableOption "nix";
  };
  config = lib.mkIf config.my.lang.nix.enable {
    programs.neovim.extraPackages = with pkgs; [
      nix
      nixfmt-rfc-style
    ];

    my.neovim.treesitterParsers = [ "nix" ];

    xdg.configFile."nvim/lua/plugins/nix.lua".source = ./spec.lua;
  };
}

