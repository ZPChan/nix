{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    my.git.enable = lib.mkEnableOption "git";
  };
  config = lib.mkIf config.my.git.enable {
    programs.git.enable = lib.mkDefault true;
    environment.systemPackages = with pkgs; [
      git
      gh
    ];
  };
}
