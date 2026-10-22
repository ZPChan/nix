{
  self,
  lib,
  ...
}:
let
  username = "ai-agent";
  fullname = "Zach Putman (AI Agent)";
  gitemail = "23585500+ZPChan@users.noreply.github.com";
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

      homeManager."${username}" = {
        programs.git.settings.user = {
          name = "${fullname}";
          email = "${gitemail}";
        };
      };
    }
  ];
}
