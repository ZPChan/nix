{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.programs.neovim.enable {
    programs.neovim = {
      
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      extraPackages = with pkgs; [
        lua-language-server
        stylua
        ripgrep
        gcc
        fzf
        fd
        nil
      ];

      plugins = with pkgs.vimPlugins; [
        lazy-nvim
      ];
    };

    home.file = {
      ".config/nvim" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix/dotfiles/nvim";
      };
    };
  };
}
