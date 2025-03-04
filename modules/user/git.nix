{
  pkgs,
  lib,
  config,
  ...
}:
{
  config = lib.mkIf config.programs.git.enable {
    programs.git = {
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };
}
