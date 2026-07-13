{
  flake.modules.nixos.desktop =
    {
      config,
      lib,
      modulesPath,
      ...
    }:
    {
      imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

      boot.initrd.availableKernelModules = [
        "nvme"
        "xhci_pci"
        "ahci"
        "uas"
        "usbhid"
        "sd_mod"
      ];
      boot.initrd.kernelModules = [ ];
      boot.kernelModules = [ "kvm-amd" ];
      boot.extraModulePackages = [ ];

      fileSystems."/" = {
        device = "/dev/mapper/luks-b519a80e-2d24-4d21-8478-94f1d61001b7";
        fsType = "ext4";
      };

      boot.initrd.luks.devices."luks-b519a80e-2d24-4d21-8478-94f1d61001b7".device =
        "/dev/disk/by-uuid/b519a80e-2d24-4d21-8478-94f1d61001b7";

      fileSystems."/boot" = {
        device = "/dev/disk/by-uuid/4131-95F1";
        fsType = "vfat";
        options = [
          "fmask=0077"
          "dmask=0077"
        ];
      };

      swapDevices = [ ];

      hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
}
