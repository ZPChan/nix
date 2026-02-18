{
  inputs,
  ...
}:
let
  hostName = "timberlane-server";
in
{
  flake.nixosConfigurations = inputs.self.lib.mkNixos "x86_64-linux" "${hostName}";

  flake.modules.nixos."${hostName}" = {

    networking.hostName = "${hostName}";

    imports = with inputs.self.modules.nixos; [
      adguardhome
      bootloader
      cli-tools-advanced
      docker
      mdns
      ssh
      system-simple
      wifi
      zach
    ];

    home-manager.users.zach = {
      imports = with inputs.self.modules.homeManager; [
        cli-tools-advanced
        system-simple
        zach
      ];
    };

  };
}
