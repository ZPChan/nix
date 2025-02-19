{ pkgs, lib, config, inputs, systemType, ... }: {
  options = {
    zenbrowser.enable = lib.mkEnableOption "enables zenbrowser module";
  };
  config = lib.mkIf config.zenbrowser.enable {
    environment.systemPackages = [
      inputs.zen-browser.packages."${systemType}".default
    ];
  };
}

