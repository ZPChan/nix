{
  flake.modules.nixos.zelda-laptop-hp =
    {
      config,
      lib,
      modulesPath,
      ...
    }:
    {
      imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

      boot.initrd.availableKernelModules = [
        "xhci_pci"
	"nvme"
        "uas"
        "sd_mod"
      ];
      boot.initrd.kernelModules = [ ];
      boot.kernelModules = [ ];
      boot.extraModulePackages = [ ];

      fileSystems."/" =
        { device = "/dev/disk/by-uuid/019b148c-5517-4515-895b-cd80e9a89524";
          fsType = "ext4";
        };
    
      fileSystems."/boot" =
        { device = "/dev/disk/by-uuid/627B-9355";
          fsType = "vfat";
          options = [ "fmask=0077" "dmask=0077" ];
        };
    
      swapDevices =
        [ { device = "/dev/disk/by-uuid/c6740b06-3723-4c64-9e4f-cc536db98b4f"; }
        ];
    
      hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
}
