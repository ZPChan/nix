{ lib, config, ... }:
{
  imports = [
    ./bash
    ./json
    ./jsonnet
    ./lua
    ./nix
    ./markdown
  ];
}
