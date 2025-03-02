{ config, pkgs, inputs, lib, osConfig, ... }:
let
  userName = "nixos";
  userFullName = "Zach Putman";
  userGitEmail = "23585500+ZPChan@users.noreply.github.com";
in {
  imports = [
    ./../../modules/user
  ];

  home.username = "${userName}";
  home.homeDirectory = "/home/${userName}";
  programs.git = {
    userName = "${userFullName}";
    userEmail = "${userGitEmail}";
  };

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
