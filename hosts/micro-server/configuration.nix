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
  hostName = "micro-server";
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
  networking.wireless.enable = true;

  my.user.userName = "${userName}";
  my.user.userFullName = "${userFullName}";

  catppuccin = {
    flavor = "mocha";
    accent = "mauve";
  };

  my.autoupdate.enable = true;
  my.dev.enable = true;
  my.git.enable = true;
  my.mdns.enable = true;
  my.mdns.publish = true;
  my.nvim.enable = true;
  my.remapcaps.enable = true;
  my.ssh.enable = true;
  my.tmux.enable = true;
  my.user.enable = true;
  my.zsh.enable = true;
  my.nushell.enable = true;
  my.nushell.defaultShell = true;

  virtualisation.docker.enable = true;

  home-manager = {
    users."${userName}" = {
      imports = [
        ./home.nix
        inputs.catppuccin.homeModules.catppuccin
        inputs.LazyVim.homeManagerModules.default
      ];
    };
  };

  system.stateVersion = "25.05";
}
