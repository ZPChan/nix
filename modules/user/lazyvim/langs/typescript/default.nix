{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.lang.typescript.enable = lib.mkEnableOption "typescript";
  };
  config = lib.mkIf config.my.lang.typescript.enable {
    programs.lazyvim = {
      extras.lang.typescript.enable = lib.mkDefault true;
      extraPackages = with pkgs; [
        typescript-language-server
        prettierd
      ];
      treesitterParsers = with pkgs.vimPlugins.nvim-treesitter.grammarPlugins; [
        typescript
      ];
      plugins."my.lang.typescript" = builtins.readFile ./spec.lua;
    };
  };
}
