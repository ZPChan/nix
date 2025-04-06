{
  pkgs,
  lib,
  inputs,
  config,
  ...
}:
let
  userName = "zach";
  userFullName = "Zach Putman";
  hostName = "nixos-lite";
in
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/system
    inputs.home-manager.nixosModules.default
    inputs.catppuccin.nixosModules.catppuccin
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "${hostName}";

  my.user.userName = "${userName}";
  my.user.userFullName = "${userFullName}";

  my.autoupdate.enable = true;
  my.dev.enable = true;
  my.git.enable = true;
  my.hyprland.enable = true;
  my.nvim.enable = true;
  my.remapcaps.enable = true;
  my.sound.enable = true;
  my.tmux.enable = true;
  my.twingate.enable = true;
  my.user.enable = true;
  my.wifi.enable = true;
  my.xserver.enable = true;
  my.zenbrowser.enable = true;
  my.zsh.enable = true;

  services.printing.enable = true;

  home-manager = {
    users."${userName}" = {
      imports = [
        ./home.nix
        inputs.catppuccin.homeModules.catppuccin
        inputs.LazyVim.homeManagerModules.default
      ];
    };
  };

  system.stateVersion = "24.11";
}
