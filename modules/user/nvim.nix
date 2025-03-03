{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.programs.neovim.enable {
    programs.neovim = {
      
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      withNodeJs = true;

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
        dockerfile-language-server-nodejs
        hadolint
        helm-ls
        lua-language-server
        markdownlint-cli2
        marksman
        netcoredbg
        nodejs_23
        nodePackages.vscode-json-languageserver
        omnisharp-roslyn
        semgrep
        shellcheck
        shfmt
        sqlfluff
        stylua
        vimPlugins.vim-markdown-toc
        vtsls
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
