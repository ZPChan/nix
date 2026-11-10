{
  self,
  inputs,
  lib,
  ...
}:
let
  username = "zach";
  fullname = "Zach Putman";
  gitemail = "zputman-agent@waltersandwolf.com";
  hostName = "${username}-agent-wsl";
in
{
  flake.nixosConfigurations = inputs.self.lib.mkNixos "x86_64-linux" "${hostName}";

  flake.modules.nixos."${hostName}" = lib.mkMerge [
    (self.factory.ww-agent-wsl "${username}" "${fullname}" "${gitemail}")
    {
      imports = with inputs.self.modules.nixos; [
        zach
        zach-default-shell-nushell
      ];

      home-manager.users.zach = {
        imports = with inputs.self.modules.homeManager; [
          cli-tools-advanced
          system-wsl
          zach
        ];
      };
    }
  ];
}
