{
  self,
  inputs,
  lib,
  ...
}:
{
  config.flake.factory.user = username: isAdmin: {

    nixos."${username}" = {
      users.users."${username}" = {
        isNormalUser = true;
        home = "/home/${username}";
        extraGroups = lib.optionals isAdmin [
          "wheel"
        ];
      };

      home-manager.users."${username}" = {
        imports = [
          self.modules.homeManager."${username}"
        ];
      };
    };

    nixos."${username}-auto-login" = {
      imports = [
        inputs.self.modules.nixos."${username}"
      ];

      services.displayManager.autoLogin = {
        enable = true;
        user = "${username}";
      };
    };

    homeManager."${username}" = {
      home.username = "${username}";
    };
  };
}
