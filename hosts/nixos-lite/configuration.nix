{ pkgs, lib, inputs, config, system, ... }:
{
  options = {
    userName = lib.mkOption { type = lib.types.str; };
    userFullName = lib.mkOption { type = lib.types.str; };
    hostName = lib.mkOption { type = lib.types.str; };
  };
  config = rec {
    userName = "zach";
    userFullName = "Zach Putman";
    hostName = "nixos-lite";

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
  };
}
