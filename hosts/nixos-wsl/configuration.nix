{
  pkgs,
  lib,
  inputs,
  config,
  ...
}:
let
  userName = "zach";
  userFullName = "Zach Putman";
  hostName = "nixos-wsl";
in
{
  imports = [
    ./../../modules/system
    ./../../modules/system/wsl.nix
    inputs.home-manager.nixosModules.default
    inputs.catppuccin.nixosModules.catppuccin
  ];

  my.wsl = {
    enable = true;
    userName = "${userName}";
  };

  networking.hostName = "${hostName}";

  my.user.userName = "${userName}";
  my.user.userFullName = "${userFullName}";

  catppuccin = {
    flavor = "mocha";
    accent = "mauve";
  };

  my.autoupdate.enable = true;
  my.dev.enable = true;
  my.git.enable = true;
  my.nvim.enable = true;
  my.tmux.enable = true;
  my.zsh.enable = true;
  my.nushell.enable = true;
  my.nushell.defaultShell = true;

  home-manager = {
    users."${userName}" = {
      imports = [
        ./home.nix
        inputs.catppuccin.homeModules.catppuccin
        inputs.LazyVim.homeManagerModules.default
      ];
    };
  };

  system.stateVersion = "24.11";
}
