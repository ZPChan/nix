{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.services.xserver.enable {
    services.xserver = {
      displayManager.gdm.enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };
}

