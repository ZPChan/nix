{ pkgs, lib, config, ... }: {
  imports = [
    ./stdBundle.nix
    ./optBundle.nix
  ];
}

