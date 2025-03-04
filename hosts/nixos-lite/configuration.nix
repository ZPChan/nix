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

  user.userName = "${userName}";
  user.userFullName = "${userFullName}";

  programs.zsh.enable = true;
  programs.hyprland.enable = true;
  services.twingate.enable = true;

  environment.systemPackages = with pkgs; [
    nodejs_23
    nodePackages.vscode-json-languageserver
  ];

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
