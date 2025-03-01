{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.programs.git.enable {
    programs.git = {
      userName = "Zach Putman";
      userEmail = "23585500+ZPChan@users.noreply.github.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };
}

