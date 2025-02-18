{ pkgs, lib, config, ... }: {
  imports = [
    ./git.nix
    ./hyprland.nix
    ./waybar.nix
    ./nvim.nix
  ];

  git.enable = lib.mkDefault true;
  nvim.enable = lib.mkDefault true;
}
