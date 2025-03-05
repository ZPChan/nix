{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.nvim.enable = lib.mkEnableOption "enables nvim module";
  };
  config = lib.mkIf config.my.nvim.enable {
    environment.systemPackages = with pkgs; [
      neovim
      wl-clipboard
      wget
      unzip
    ];
    fonts.packages = with pkgs; [
      nerd-fonts.caskaydia-cove
    ];
  };
}
