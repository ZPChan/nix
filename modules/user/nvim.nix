{ pkgs, lib, config, ... }: {
  options = {
    nvim.enable = lib.mkEnableOption "enables nvim module";
  };
  config = lib.mkIf config.nvim.enable {
    programs.neovim = {
      enable = true;
      
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      plugins = with pkgs.vimPlugins; [
        LazyVim
      ];

      # extraLuaConfig = ''
      #   ${builtins.readFile ./dotfiles/nvim/init.lua}
      # '';
    };
  };
}

