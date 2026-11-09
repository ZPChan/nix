{
  self,
  lib,
  ...
}:
let
  username = "localadmin";
in
{
  flake.modules = lib.mkMerge [
    (self.factory.user "${username}" true)
    {
      nixos."${username}" = {
        users.users."${username}" = {
          initialPassword = "password";
        };
      };
    }
  ];
}
