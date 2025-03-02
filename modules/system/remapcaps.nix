{ pkgs, lib, config, ... }: {
  options = {
    services.remapcaps.enable = lib.mkEnableOption "enables remapcaps module";
  };
  config = lib.mkIf config.services.remapcaps.enable {
    environment.systemPackages = with pkgs; [
      kanata
    ];

    services.kanata = {
      enable = true;
      keyboards.main.config = ''
      (defsrc caps)
      (deflayer main esc)
      '';
    };
  };
}


