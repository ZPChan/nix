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

  my.user.userName = "${userName}";
  my.user.userFullName = "${userFullName}";

  my.autoupdate.enable = true;
  my.dev.enable = true;
  my.git.enable = true;
  my.nvim.enable = true;
  my.tmux.enable = true;
  my.zsh.enable = true;

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
