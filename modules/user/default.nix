{ pkgs, lib, config, ... }: {
  imports = [
    ./hyprland.nix
    ./git.nix
  ];

  git.enable = lib.mkDefault true;
}
