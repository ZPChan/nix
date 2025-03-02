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
    ./nvim.nix
    ./git.nix
    ./ssh.nix
    ./suid.nix
    ./zenbrowser.nix
    ./twingate.nix
    ./autoupdate.nix
  ];

  user.enable = lib.mkDefault true;
  services.wifi.enable = lib.mkDefault true;
  services.printing.enable = lib.mkDefault true;
  services.audio.enable = lib.mkDefault true;
  services.xserver.enable = lib.mkDefault true;
  services.autoupdate.enable = lib.mkDefault true;
  programs.firefox.enable = lib.mkDefault true;
  programs.zenbrowser.enable = lib.mkDefault true;
  programs.nvim.enable = lib.mkDefault true;
  programs.git.enable = lib.mkDefault true;
}

