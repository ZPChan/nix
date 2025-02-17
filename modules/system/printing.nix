{ pkgs, lib, config, ... }: {
  options = {
    printing.enable = lib.mkEnableOption "enables printing module";
  };
  config = lib.mkIf config.printing.enable {
    # Enable CUPS to print documents.
    services.printing.enable = true;
  };
}

