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
      autoUpgrade-allowReboot
      bootloader
      cli-tools-basic
      mdns
      podman
      ssh
      system-bare
      twingate-quaint-starling
      twingate-hallowed-marten
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
