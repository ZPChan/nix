{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.git.enable = lib.mkEnableOption "enables git module";
  };
  config = lib.mkIf config.my.git.enable {
    programs.git = {
      enable = true;
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };
}
