{
  pkgs,
  lib,
  config,
  ...
}:
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

}
