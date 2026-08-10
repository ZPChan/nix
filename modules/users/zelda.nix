{
  self,
  lib,
  ...
}:
let
  username = "zelda";
in
{
  flake.modules = lib.mkMerge [
    (self.factory.user "${username}" false)
    {
      nixos."${username}" =
        { pkgs, ... }:
        {
          users.users."${username}" = {
            initialPassword = "password";
            shell = pkgs.bash;
          };
        };
    }
  ];
}
