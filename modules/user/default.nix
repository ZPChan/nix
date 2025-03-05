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
    ./neovim
    ./webdev
    ./starship.nix
    ./zsh.nix
  ];
}
