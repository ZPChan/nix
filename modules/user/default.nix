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
    ./nushell.nix
    ./starship.nix
    ./tmux.nix
    ./webdev
    ./zsh.nix
  ];
}
