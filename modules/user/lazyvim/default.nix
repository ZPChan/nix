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
  };
  config = lib.mkIf config.my.lazyvim.enable {

    my.lang.bash.enable = lib.mkDefault true;
    my.lang.lua.enable = lib.mkDefault true;
    my.lang.nix.enable = lib.mkDefault true;

    programs.lazyvim = {
      enable = lib.mkDefault true;
      pluginSource = "nixpkgs";
      extras = {
        coding = {
          yanky.enable = lib.mkDefault true;
          mini_surround.enable = lib.mkDefault true;
        };
        editor = {
          dial.enable = lib.mkDefault true;
          inc_rename.enable = lib.mkDefault true;
        };
        test = {
          core.enable = lib.mkDefault true;
        };
        util = {
          dot.enable = lib.mkDefault true;
          mini_hipatterns.enable = lib.mkDefault true;
        };
      };
      plugins.colorscheme = ''
        return {
          {
            "LazyVim/LazyVim",
            opts = {
              colorscheme = "catppuccin",
            },
          },
        }
      '';
    };
  };
}
