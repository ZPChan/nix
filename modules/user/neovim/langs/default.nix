{ lib, ... }: {
  imports = [
    ./nix
    ./lua
    ./json
  ];

  my.lang.nix.enable = lib.mkDefault true;
  my.lang.lua.enable = lib.mkDefault true;
  my.lang.json.enable = lib.mkDefault true;
}

