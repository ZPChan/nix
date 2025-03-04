{
  pkgs,
  lib,
  inputs,
  config,
  ...
}:
let
  userName = "nixos";
  userFullName = "Zach Putman";
  hostName = "nixos-wsl";
in
{
  imports = [
    ./../../modules/system
    inputs.home-manager.nixosModules.default
    inputs.catppuccin.nixosModules.catppuccin
  ];

  wsl.enable = true;
  wsl.defaultUser = "nixos";

  networking.hostName = "${hostName}";

  user.userName = "${userName}";
  user.userFullName = "${userFullName}";

  services.wifi.enable = false;
  services.printing.enable = false;
  services.audio.enable = false;
  services.xserver.enable = false;
  services.remapcaps.enable = false;

  programs.zsh.enable = true;
  programs.firefox.enable = false;
  programs.zenbrowser.enable = false;

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
