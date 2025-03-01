{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.programs.zsh.enable {

    users.users."${config.user.userName}".shell = pkgs.zsh;

    environment.systemPackages = with pkgs; [
      zsh
    ];

    home-manager.users."${config.user.userName}".programs.zsh.enable = true;
  };
}


