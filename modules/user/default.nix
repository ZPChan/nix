{ pkgs, lib, config, ... }: {
  imports = [
    ./git.nix
    ./hyprland.nix
    ./waybar.nix
  ];

  git.enable = lib.mkDefault true;
}
