{ pkgs, lib, config, ... }: {
  options = {
    firefox.enable = lib.mkEnableOption "enables firefox module";
  };
  config = lib.mkIf config.firefox.enable {
    programs.firefox.enable = true;
  };
}

