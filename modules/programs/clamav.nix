{
  flake.modules.nixos.clamav =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        clamav
      ];
      services.clamav.daemon.enable = true;
      services.clamav.updater.enable = true;
      services.clamav.scanner.enable = true;
    };
}

