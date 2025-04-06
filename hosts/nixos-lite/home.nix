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

  my.git.enable = true;
  my.hyprland.enable = true;
  # my.neovim.enable = true;
  my.starship.enable = true;
  my.tmux.enable = true;
  # my.webdev.enable = true;
  my.zsh.enable = true;

  services.remmina.enable = true;

  programs.lazyvim = {
    enable = true;
  };

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
