{ pkgs, lib, inputs, config, ... }:
rec {
  imports =
    [
      ./hardware-configuration.nix
      ./../../modules/system
      inputs.home-manager.nixosModules.default
      inputs.catppuccin.nixosModules.catppuccin
    ];

  userName = "zach";
  userFullName = "Zach Putman";
  hostName = "nixos-lite";
  
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = hostName;

  zsh.enable = true;
  hyprland.enable = true;
  twingate.enable = true;

  home-manager = {
    users."${userName}" = {
      imports = [
        ./home.nix
        inputs.catppuccin.homeManagerModules.catppuccin
      ];
    };
  };

  system.stateVersion = "24.11";
}
