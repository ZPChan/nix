{ config, pkgs, inputs, lib, ... }:

{
  imports = [
    ./../../modules/user/default.nix
  ];

  hyprland.enable = true;
  starship.enable = true;

  home.username = "zach";
  home.homeDirectory = "/home/zach";

  home.stateVersion = "24.11";

  home.packages = [
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
}
