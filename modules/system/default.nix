{
  pkgs,
  lib,
  config,
  ...
}:
{
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
    ./remapcaps.nix
    ./git.nix
    ./ssh.nix
    ./suid.nix
    ./zenbrowser.nix
    ./twingate.nix
    ./autoupdate.nix
    ./dev
  ];

}
