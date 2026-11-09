{
  self,
  lib,
  ...
}:
let
  username = "ai-agent";
in
{
  flake.modules = lib.mkMerge [
    (self.factory.user "${username}" false)
    {
      nixos."${username}" = {
        users.users."${username}" = {
          initialPassword = "password";
        };
      };
    }
  ];
}
