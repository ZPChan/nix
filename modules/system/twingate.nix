{ pkgs, lib, config, ... }: {
  options = {
    twingate.enable = lib.mkEnableOption "enables twingate module";
  };
  config = lib.mkIf config.twingate.enable {
    environment.systemPackages = with pkgs; [
      twingate
    ];

    services.twingate.enable = true;
  };
}

