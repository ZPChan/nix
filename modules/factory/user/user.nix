{
  self,
  inputs,
  lib,
  ...
}:
{
  config.flake.factory.user = username: isAdmin: {

    nixos = {
      "${username}" = {
        users.users."${username}" = {
          isNormalUser = true;
          home = "/home/${username}";
          extraGroups = lib.optionals isAdmin [
            "wheel"
          ];
        };
      };

      "${username}-auto-login" = {
        services.displayManager.autoLogin = {
          enable = true;
          user = "${username}";
        };
      };

      "${username}-default-shell-zsh" =
        { pkgs, ... }:
        {
          users.users."${username}" = {
            shell = pkgs.zsh;
          };
        };

      "${username}-default-shell-nushell" =
        { pkgs, ... }:
        {
          users.users."${username}" = {
            shell = pkgs.nushell;
          };
        };
    };

    homeManager."${username}" = {
      home.username = "${username}";
    };
  };
}
