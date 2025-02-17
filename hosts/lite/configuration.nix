{ pkgs, lib, inputs, config, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./../../modules/system/stdBundle.nix
      ./../../modules/system/optBundle.nix
      inputs.home-manager.nixosModules.default
    ];
  
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "lite";
  networking.networkmanager.enable = true;

  hyprland.enable = true;

  home-manager."zach" = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      modules = [
        ./home.nix
	inputs.self.outputs.homeManagerModules.default
      ];
    };
  };

  system.stateVersion = "24.11";
}
