{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.programs.neovim.enable {
    programs.neovim = {
      
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      extraPackages = with pkgs; [
        ripgrep
        gcc
        fzf
        fd
        nil

        bash-language-server
        csharpier
        djlint
        docker-compose-language-service
        hadolint
        helm-ls
        lua-language-server
        markdownlint-cli2
        marksman
        netcoredbg
        semgrep
        shellcheck
        shfmt
        sqlfluff
        stylua
        vtsls
        vscode-json-language-server
        yaml-language-server
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
