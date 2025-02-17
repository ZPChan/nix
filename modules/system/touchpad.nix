{ pkgs, lib, config, ... }: {
  options = {
    touchpad.enable = lib.mkEnableOption "enables touchpad module";
  };
  config = lib.mkIf config.touchpad.enable {
    # Enable touchpad support (enabled default in most desktopManager).
    services.xserver.libinput.enable = true;
  };
}

