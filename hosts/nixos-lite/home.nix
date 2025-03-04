{
  config,
  pkgs,
  inputs,
  lib,
  osConfig,
  ...
}:
let
  userName = "zach";
  userFullName = "Zach Putman";
  userGitEmail = "23585500+ZPChan@users.noreply.github.com";
in
{
  imports = [
    ./../../modules/user
  ];

  home.username = "${userName}";
  home.homeDirectory = "/home/${userName}";
  programs.git = {
    userName = "${userFullName}";
    userEmail = "${userGitEmail}";
  };

  programs.hyprland.enable = true;
  programs.zsh.enable = true;
  services.remmina.enable = true;

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
