{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.lang.bash.enable = lib.mkEnableOption "bash";
  };
  config = lib.mkIf config.my.lang.bash.enable {

    programs.lazyvim = {
      pluginsFile."my.lang.bash.lua".source = ./spec.lua;
    };

    programs.neovim.extraPackages = with pkgs; [
      bash-language-server
      shellcheck
      shfmt
    ];

    my.lazyvim.treesitterParsers = [ "bash" ];
  };
}
