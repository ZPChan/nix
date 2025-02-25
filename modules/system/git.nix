{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.programs.git.enable {
    environment.systemPackages = with pkgs; [
      git
      lazygit
      gh
    ];
  };
}

