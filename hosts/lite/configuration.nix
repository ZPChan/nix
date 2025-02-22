{ pkgs, lib, inputs, config, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./../../modules/system/stdBundle.nix
      ./../../modules/system/optBundle.nix
      inputs.home-manager.nixosModules.default
      inputs.catppuccin.nixosModules.catppuccin
    ];
  
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "lite";
    networkmanager.enable = true;
    wireless = {
      enable = true;
      userControlled.enable = true;
    };
  };

  zsh.enable = true;
  hyprland.enable = true;
  twingate.enable = true;

  home-manager.users."zach" = {
    imports = [
      ./home.nix
      inputs.catppuccin.homeManagerModules.catppuccin
    ];
  };

  system.stateVersion = "24.11";
}
