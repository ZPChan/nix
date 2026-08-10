{
  flake.modules.nixos.system-vmVariant4Gb = {
    virtualisation.vmVariant = {
      virtualisation = {
        memorySize = 4096;
        cores = 4;
      };
    };
    virtualisation.vmVariantWithBootLoader = {
      virtualisation = {
        memorySize = 4096;
        cores = 4;
      };
    };
  };
}
