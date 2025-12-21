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

  programs.git.settings.user = {
    name = "${userFullName}";
    email = "${userGitEmail}";
  };

  catppuccin = {
    flavor = "mocha";
    accent = "mauve";
  };

  my.autogc.enable = true;
  my.dev.enable = true;
  my.git.enable = true;
  my.hyprland.enable = true;
  my.lazyvim.enable = true;
  my.webdev.enable = true;
  my.starship.enable = true;
  my.tmux.enable = true;
  my.zsh.enable = true;
  my.nushell.enable = true;

  services.remmina.enable = true;

  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
}
