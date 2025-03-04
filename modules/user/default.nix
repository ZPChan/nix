{ pkgs, lib, config, ... }: {
  imports = [
    ./git.nix
    ./hyprland.nix
    ./neovim
    ./starship.nix
    ./zsh.nix
  ];

  programs.git.enable = lib.mkDefault true;
  programs.neovim.enable = lib.mkDefault true;
}
