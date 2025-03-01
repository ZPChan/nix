{ pkgs, lib, config, ... }: {
  imports = [
    ./git.nix
    ./hyprland.nix
    ./nvim.nix
    ./starship.nix
    ./remmina.nix
  ];

  programs.git.enable = lib.mkDefault true;
  programs.neovim.enable = lib.mkDefault true;
}
