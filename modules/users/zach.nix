{
  self,
  lib,
  ...
}:
let
  username = "zach";
  fullname = "Zach Putman";
  gitemail = "23585500+ZPChan@users.noreply.github.com";
in
{
  flake.modules = lib.mkMerge [
    (self.factory.user "${username}" true)
    {
      nixos."${username}" = {
        users.users."${username}" = {
          extraGroups = [
            "docker"
            "networkmanager"
          ];
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
