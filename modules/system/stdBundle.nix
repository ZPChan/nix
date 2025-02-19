{ pkgs, lib, config, ... }: {
  imports = [
    ./locale.nix
    ./settings.nix
  ];
}
