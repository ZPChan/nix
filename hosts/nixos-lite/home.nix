{ config, pkgs, inputs, lib, userName, ... }:

{
  imports = [
    ./../../modules/user
  ];

  hyprland.enable = true;
  starship.enable = true;
  remmina.enable = true;

  home.username = "${userName}";
  home.homeDirectory = "/home/${userName}";

  home.stateVersion = "24.11";

  home.packages = [
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
}
