{ pkgs, lib, config, ... }: {
  options = {
    remmina.enable = lib.mkEnableOption "enables remmina module";
  };
  config = lib.mkIf config.remmina.enable {
    services.remmina.enable = true;
  };
}

