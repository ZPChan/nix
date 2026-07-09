{
  flake.modules.nixos.zelda-laptop =
    {
      config,
      lib,
      modulesPath,
      ...
    }:
    {
      hardware.enableRedistributableFirmware = lib.mkDefault true;

      imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

      nixpkgs.config.permittedInsecurePackages = [
        "broadcom-sta-6.30.223.271-59-7.0.10"
      ];

      boot.initrd.availableKernelModules = [
        "xhci_pci"
        "ahci"
        "usbhid"
        "uas"
        "usb_storage"
        "sd_mod"
      ];
      boot.initrd.kernelModules = [ "wl" ];
      boot.kernelModules = [
        "wl"
        "kvm-intel"
      ];
      boot.extraModulePackages = [ config.boot.kernelPackages.broadcom_sta ];

      fileSystems."/" = {
        device = "/dev/disk/by-uuid/a44ecb32-8ef1-49ce-98a8-a8322d36be79";
        fsType = "ext4";
      };
      fileSystems."/boot" = {
        device = "/dev/disk/by-uuid/2D07-743F";
        fsType = "vfat";
        options = [
          "fmask=0077"
          "dmask=0077"
        ];
      };

      swapDevices = [
        {
          device = "/dev/disk/by-uuid/2c76aa23-4edd-4f93-83d5-b5fb58c41ac3";
        }
      ];

      hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
}
