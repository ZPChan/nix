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
    my.lazyvim.enable = lib.mkDefault true;
    my.lang.css.enable = lib.mkDefault true;
    my.lang.html.enable = lib.mkDefault true;
    my.lang.javascript.enable = lib.mkDefault true;
    my.lang.jinja.enable = lib.mkDefault true;
    my.lang.json.enable = lib.mkDefault true;
    my.lang.jsonnet.enable = lib.mkDefault true;
    my.lang.markdown.enable = lib.mkDefault true;
    my.lang.typescript.enable = lib.mkDefault true;
  };
}
