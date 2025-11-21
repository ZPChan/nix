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
      wl-clipboard
      wget
      unzip
      ripgrep
    ];

    programs.neovim = {
      enable = true;
      defaultEditor = true;
    };

    fonts.packages = with pkgs; [
      nerd-fonts.caskaydia-cove
    ];
  };
}
