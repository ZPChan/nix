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

        bash-debug-adapter
        bash-language-server
        csharpier
        djlint
        docker-compose-language-service
        dockerfile-language-server
        hadolint
        helm-ls
        json-lsp
        lua-language-server
        markdown-toc
        markdownlint-cli2
        marksman
        netcoredbg
        omnisharp
        semgrep
        shellcheck
        shfmt
        sqlfluff
        stylua
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
