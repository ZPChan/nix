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
      settings = {
        init.defaultBranch = "main";
        difftool.prompt = true;
        diff.tool = "nvimdiff";
        difftool."nvimdiff".cmd = "nvim -d \"$LOCAL\" \"$REMOTE\"";
      };
    };
  };
}
