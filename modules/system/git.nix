{ pkgs, lib, config, ... }: {
  options = {
    git.enable = lib.mkEnableOption "enables git module";
  };
  config = lib.mkIf config.git.enable {
    environment.systemPackages = with pkgs; [
      git
      lazygit
      gh
    ];
  };
}

