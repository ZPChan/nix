{
  flake.modules.nixos.bootloader-grub =
    { pkgs, ... }:
    {
      boot.loader.grub = {
        enable = true;
        device = "/dev/sda";
        useOSProber = true;
      };

      boot.kernelPackages = pkgs.linuxPackages_latest;
    };
}
