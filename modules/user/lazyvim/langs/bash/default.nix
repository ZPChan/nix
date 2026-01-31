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
      extraPackages = with pkgs; [
        bash-language-server
        shellcheck
        shfmt
      ];
      treesitterParsers = with pkgs.vimPlugins.nvim-treesitter.grammarPlugins; [
        bash
      ];
      plugins."my.lang.bash" = builtins.readFile ./spec.lua;
    };
  };
}
