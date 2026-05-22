{
  flake.modules.nixos.desktop =
    {
      config,
      lib,
      ...
    }:
    {
      hardware.enableRedistributableFirmware = lib.mkDefault true;

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "uas" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/mapper/luks-b519a80e-2d24-4d21-8478-94f1d61001b7";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-b519a80e-2d24-4d21-8478-94f1d61001b7".device = "/dev/disk/by-uuid/b519a80e-2d24-4d21-8478-94f1d61001b7";

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/4131-95F1";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices =
    [ { device = "/dev/mapper/luks-51368152-9aa8-4430-8ad0-b0f2cec626fb"; }
    ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
