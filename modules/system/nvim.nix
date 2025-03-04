{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    programs.nvim.enable = lib.mkEnableOption "enables nvim module";
  };
  config = lib.mkIf config.programs.nvim.enable {
    environment.systemPackages = with pkgs; [
      neovim
      wl-clipboard
      wget
      unzip
    ];
    fonts.packages = with pkgs; [
      nerd-fonts.caskaydia-cove
    ];

    services.remapcaps.enable = lib.mkDefault true;
  };
}
