{ pkgs, lib, config, ... }: {
  options = {
    git.enable = lib.mkEnableOption "enables git module";
  };
  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      userName = "Zach Putman";
      userEmail = "23585500+ZPChan@users.noreply.github.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };
}

