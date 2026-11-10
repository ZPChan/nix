{
  self,
  inputs,
  lib,
  ...
}:
let
  userName = "zach";
  fullName = "Zach Putman";
  agentGitEmail = "zputman-agent@waltersandwolf.com";
  hostName = "${userName}-agent-wsl";
in
{
  flake.nixosConfigurations = inputs.self.lib.mkNixos "x86_64-linux" "${hostName}";

  flake.modules.nixos."${hostName}" = lib.mkMerge [
    (self.factory.ww-agent-wsl "${userName}" "${fullName}" "${agentGitEmail}")
    {
      networking.hostName = "${hostName}";

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
