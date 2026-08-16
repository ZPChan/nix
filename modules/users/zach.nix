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
          initialPassword = "password";
          extraGroups = [
            "docker"
            "podman"
            "networkmanager"
          ];
          openssh.authorizedKeys.keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEuPWN2PbnJpg2EpELI3sgjhbDZkquXSpOL2YsNQK6jx "
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
