{
  inputs,
  ...
}:
let
  hostName = "zach-agent-wsl";
in
{
  flake.nixosConfigurations = inputs.self.lib.mkNixosStable "x86_64-linux" "${hostName}";

  flake.modules.nixos."${hostName}" = {

    networking.hostName = "${hostName}";

    imports = with inputs.self.modules.nixos; [
      ww-agent-wsl
      zach
      zach-default-shell-nushell
    ];

    users.users."zach".uid = 1000;

    home-manager.users.zach = {
      imports = with inputs.self.modules.homeManager; [
        cli-tools-advanced
        system-wsl
        zach
      ];
    };
  };
}
