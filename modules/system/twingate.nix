{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.services.twingate.enable {
    environment.systemPackages = with pkgs; [
      twingate
    ];
  };
}

