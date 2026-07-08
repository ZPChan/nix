{
  flake.modules.nixos.zelda-laptop =
    {
      lib,
      modulesPath,
      ...
    }:
    {
      hardware.enableRedistributableFirmware = lib.mkDefault true;

      imports = [ (modulesPath + "/profiles/qemu-guest.nix") ];

      boot.initrd.availableKernelModules = [
        "ata_piix"
        "uhci_hcd"
        "virtio_pci"
        "virtio_scsi"
        "sd_mod"
        "sr_mod"
      ];
      boot.initrd.kernelModules = [ ];
      boot.kernelModules = [ ];
      boot.extraModulePackages = [ ];

      fileSystems."/" = {
        device = "/dev/disk/by-uuid/7c36be1b-27a6-466b-9a7a-da1290dc2bf4";
        fsType = "ext4";
      };

      swapDevices = [ ];
    };
}
