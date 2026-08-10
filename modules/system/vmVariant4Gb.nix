{
  flake.modules.nixos.system-vmVariant4Gb = {
    virtualisation.vmVariant = {
      virtualisation = {
        memorySize = 4096;
        cores = 4;
      };
    };
    virtualisation.vmVariantWithBootloader = {
      virtualisation = {
        memorySize = 4096;
        cores = 4;
      };
    };
  };
}
