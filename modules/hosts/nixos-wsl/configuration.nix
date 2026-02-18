{
  inputs,
  ...
}:
let
  hostName = "nixos-wsl";
in
{
  flake.nixosConfigurations = inputs.self.lib.mkNixos "x86_64-linux" "${hostName}";

  flake.modules.nixos."${hostName}" = {

    networking.hostName = "${hostName}";

    imports = with inputs.self.modules.nixos; [
      cli-tools-advanced
      mdns
      system-wsl
      twingate
      zach
    ];

    home-manager.users.zach = {
      imports = with inputs.self.modules.homeManager; [
        cli-tools-advanced
        system-wsl
        zach
      ];
    };
  };
}
