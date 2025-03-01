{ config, pkgs, inputs, lib, osConfig, ... }:

{
  imports = [
    ./../../modules/user
  ];

  programs.hyprland.enable = true;
  programs.starship.enable = true;
  services.remmina.enable = true;

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
