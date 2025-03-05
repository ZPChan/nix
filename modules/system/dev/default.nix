{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.dev.enable = lib.mkEnableOption "dev";
  };
  config = lib.mkIf config.my.dev.enable {

    my.nvim.enable = lib.mkDefault true;

    environment.systemPackages = with pkgs; [
      ranger
      curl
    ];
  };
}
