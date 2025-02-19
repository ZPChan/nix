{ pkgs, lib, config, ... }: {
  options = {
    zsh.enable = lib.mkEnableOption "enables zsh module";
  };
  config = lib.mkIf config.zsh.enable {

    programs.zsh.enable = true;

    users.users.zach.shell = pkgs.zsh;

    environment.systemPackages = with pkgs; [
      zsh
    ];
  };
}


