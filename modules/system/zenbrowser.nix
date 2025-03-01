{ pkgs, lib, config, inputs, system, ... }: {
  options = {
    programs.zenbrowser.enable = lib.mkEnableOption "enables zenbrowser module";
  };
  config = lib.mkIf config.programs.zenbrowser.enable {
    environment.systemPackages = [
      inputs.zen-browser.packages."${system}".default
    ];
  };
}

