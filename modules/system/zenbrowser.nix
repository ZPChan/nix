{ pkgs, lib, config, inputs, ... }: {
  options = {
    zenbrowser.enable = lib.mkEnableOption "enables zenbrowser module";
  };
  config = lib.mkIf config.zenbrowser.enable {
    inputs.zen-browser.packages."${system}".default;
  };
}

