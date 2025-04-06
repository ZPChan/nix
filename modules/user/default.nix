{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
    ./git.nix
    ./hyprland.nix
    ./lazyvim
    ./webdev
    ./starship.nix
    ./zsh.nix
    ./tmux.nix
  ];
}
