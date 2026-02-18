{
  flake.modules.nixos.autogc = {
    nix.gc = {
      automatic = true;
      randomizedDelaySec = "14m";
      options = "--delete-older-than 10d";
    };
  };
}
