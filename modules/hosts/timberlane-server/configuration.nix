{
  inputs,
  ...
}:
let
  hostName = "timberlane-server";
in
{
  flake.nixosConfigurations = inputs.self.lib.mkNixosStable "x86_64-linux" "${hostName}";

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
      telegram-notify-start
      twingate-quaint-starling
      twingate-hallowed-marten
      wifi
      zach
    ];
  };
}
