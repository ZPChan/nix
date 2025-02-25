{ pkgs, lib, config, ... }: {
  imports = [
    ./git.nix
    ./hyprland.nix
    ./nvim.nix
    ./starship.nix
    ./remmina.nix
  ];

  nvim.enable = lib.mkDefault true;
}
