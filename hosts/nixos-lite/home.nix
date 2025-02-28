{ config, pkgs, inputs, lib, osConfig, ... }:

{
  imports = [
    ./../../modules/user
  ];

  hyprland.enable = true;
  starship.enable = true;
  remmina.enable = true;

  home.username = "${osConfig.userName}";
  home.homeDirectory = "/home/${osConfig.userName}";

  home.stateVersion = "24.11";

  home.packages = [
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
}
