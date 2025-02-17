{ pkgs, lib, config, ... }: {
  options = {
    xserver.enable = lib.mkEnableOption "enables xserver module";
  };
  config = lib.mkIf config.xserver.enable {
    services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };
}

