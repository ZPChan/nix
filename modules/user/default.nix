{ pkgs, lib, config, ... }: {
  imports = [
    ./git.nix
    ./hyprland.nix
    ./nvim.nix
    ./starship.nix
  ];

  programs.git.enable = lib.mkDefault true;
  programs.neovim.enable = lib.mkDefault true;
}
