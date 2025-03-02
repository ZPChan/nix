{ pkgs, lib, config, inputs, ... }: {
  options = {
    services.autoupdate.enable = lib.mkEnableOption "enables autoupdate module";
  };
  config = lib.mkIf config.services.autoupdate.enable {
    system.autoUpgrade = {
      enable = true;
      flake = inputs.self.outPath;
      flags = [
        "--update-input"
        "nixpkgs"
        "--no-write-lock-file"
        "-L" # print build logs
      ];
      dates = "02:00";
      randomizedDelaySec = "45min";
    };
  };
}

