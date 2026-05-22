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
    { device = "/dev/disk/by-uuid/44384f24-2d3c-451a-9f9a-036a0363bfd0";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/0E86-59EE";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/8902afae-83fa-47ad-a541-0f7c228f6a25"; }
    ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
