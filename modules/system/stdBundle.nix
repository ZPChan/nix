{ pkgs, lib, config, ... }: {
  imports = [
    ./user.nix
    ./locale.nix
    ./settings.nix
  ];
}
