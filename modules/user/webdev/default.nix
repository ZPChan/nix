{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    my.webdev.enable = lib.mkEnableOption "webdev";
  };
  config = lib.mkIf config.my.webdev.enable {
    my.neovim.enable = lib.mkDefault true;
    my.lang.json.enable = lib.mkDefault true;
    my.lang.markdown.enable = lib.mkDefault true;
  };
}
