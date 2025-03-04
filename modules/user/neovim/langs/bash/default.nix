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
    programs.neovim.extraPackages = with pkgs; [
      bash-language-server
      shellcheck
      shfmt
    ];

    my.neovim.treesitterParsers = [ "bash" ];

    xdg.configFile."nvim/lua/plugins/bash.lua".source = ./spec.lua;
  };
}
