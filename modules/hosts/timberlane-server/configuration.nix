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
      cli-tools-basic
      docker
      mdns
      ssh
      system-bare
      wifi
      zach
    ];

    home-manager.users.zach = {
      imports = with inputs.self.modules.homeManager; [
        system-bare
        zach
      ];
    };
  };
}
