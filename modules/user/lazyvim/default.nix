{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./langs
  ];

  options = {
    my.lazyvim.enable = lib.mkEnableOption "enables lazyvim module";
    my.lazyvim.treesitterParsers = lib.mkOption {
      default = [ ];
      example = lib.literalExpression ''
        [ "nix" pkgs.vimPlugins.nvim-treesitter-parsers.yaml ]
      '';
      type =
        with lib.types;
        listOf (oneOf [
          str
          package
        ]);
    };
  };
  config = lib.mkIf config.my.lazyvim.enable {

    my.lang.bash.enable = lib.mkDefault true;
    my.lang.lua.enable = lib.mkDefault true;
    my.lang.nix.enable = lib.mkDefault true;

    programs.lazyvim = {
      enable = lib.mkDefault true;
      extras = {
        coding = {
          yanky.enable = lib.mkDefault true;
          mini-surround.enable = lib.mkDefault true;
        };
        editor = {
          dial.enable = lib.mkDefault true;
          inc-rename.enable = lib.mkDefault true;
        };
        test = {
          core.enable = lib.mkDefault true;
        };
        util = {
          dot.enable = lib.mkDefault true;
          mini-hipatterns.enable = lib.mkDefault true;
        };
      };
    };
    home.file = {
      ".config/nvim/lua/plugins/colorscheme.lua" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix/dotfiles/nvim/lua/plugins/colorscheme.lua";
      };
    };

    xdg.configFile."nvim/parser".source =
      let
        parserStrings = builtins.filter builtins.isString config.my.neovim.treesitterParsers;
        parserPackages = builtins.filter lib.isDerivation config.my.neovim.treesitterParsers;
        parsers = pkgs.symlinkJoin {
          name = "treesitter-parsers";
          paths =
            (pkgs.vimPlugins.nvim-treesitter.withPlugins (
              plugins: lib.attrVals parserStrings plugins ++ parserPackages
            )).dependencies;
        };
      in
      "${parsers}/parser";
  };
}
