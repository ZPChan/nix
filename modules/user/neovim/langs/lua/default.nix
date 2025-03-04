{ pkgs, lib, config, ... }: {
  options = {
    my.lang.lua.enable = lib.mkEnableOption "lua";
  };
  config = lib.mkIf config.my.lang.lua.enable {
    programs.neovim.extraPackages = with pkgs; [
      lua-language-server
      stylua
    ];

    my.neovim.treesitterParsers = [ "lua" ];
  };
}


