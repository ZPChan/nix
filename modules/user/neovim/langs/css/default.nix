{ pkgs, lib, config, ... }: {
  options = {
    my.lang.css.enable = lib.mkEnableOption "css";
  };
  config = lib.mkIf config.my.lang.css.enable {
    programs.neovim.extraPackages = with pkgs; [
      vscode-langservers-extracted
      prettierd
    ];

    my.neovim.treesitterParsers = [
      "css"
    ];

    xdg.configFile."nvim/lua/plugins/css.lua".source = ./spec.lua;
  };
}

