{ pkgs, lib, config, ... }: {
  imports = [
    ./locale.nix
    ./settings.nix
    ./user.nix
    ./zsh.nix
    ./wifi.nix
    ./sound.nix
    ./xserver.nix
    ./hyprland.nix
    ./touchpad.nix
    ./nvim.nix
    ./git.nix
    ./ssh.nix
    ./suid.nix
    ./zenbrowser.nix
    ./twingate.nix
  ];

  user.enable = lib.mkDefault true;
  wifi.enable = lib.mkDefault true;
  services.printing.enable = lib.mkDefault true;
  sound.enable = lib.mkDefault true;
  xserver.enable = lib.mkDefault true;
  programs.firefox.enable = lib.mkDefault true;
  zenbrowser.enable = lib.mkDefault true;
  programs.nvim.enable = lib.mkDefault true;
  programs.git.enable = lib.mkDefault true;
}

