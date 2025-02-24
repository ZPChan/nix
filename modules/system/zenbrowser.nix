{ pkgs, lib, config, inputs, system, ... }: {
  options = {
    zenbrowser.enable = lib.mkEnableOption "enables zenbrowser module";
  };
  config = lib.mkIf config.zenbrowser.enable {
    environment.systemPackages = [
      inputs.zen-browser.packages."${system}".default
    ];
  };
}

