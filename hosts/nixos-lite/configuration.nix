{ pkgs, lib, inputs, config, ... }:
let
  userName = "zach";
in {
  imports =
    [
      ./hardware-configuration.nix
      ./../../modules/system
      inputs.home-manager.nixosModules.default
      inputs.catppuccin.nixosModules.catppuccin
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos-lite";

  user.userName = "${userName}";
  user.userFullName = "Zach Putman";

  zsh.enable = true;
  programs.hyprland.enable = true;
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
