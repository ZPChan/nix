{ lib, config, ... }:
{
  imports = [
    ./bash
    ./json
    ./lua
    ./nix
  ];

  options.my.lang.enable = lib.mkEnableOption "lang";

  config = lib.mkIf config.my.lang.enable {
    my.lang.bash.enable = lib.mkDefault true;
    my.lang.json.enable = lib.mkDefault true;
    my.lang.lua.enable = lib.mkDefault true;
    my.lang.nix.enable = lib.mkDefault true;
  };

}
