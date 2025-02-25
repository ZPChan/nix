{ pkgs, lib, config, ... }: {
  imports = [
    ./locale.nix
    ./settings.nix
    ./user.nix
    ./zsh.nix
    ./wifi.nix
    ./printing.nix
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
  printing.enable = lib.mkDefault true;
  zzsound.enable = lib.mkDefault true;
  xserver.enable = lib.mkDefault true;
  programs.firefox.enable = lib.mkDefault true;
  zenbrowser.enable = lib.mkDefault true;
  nvim.enable = lib.mkDefault true;
  programs.git.enable = lib.mkDefault true;
}

