{ pkgs, lib, config, ... }: {
  imports = [
    ./git.nix
    ./hyprland.nix
    ./nvim.nix
    ./starship.nix
    ./remmina.nix
  ];

  git.enable = lib.mkDefault true;
  nvim.enable = lib.mkDefault true;
}
