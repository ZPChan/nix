{
  inputs,
  ...
}:
let
  hostName = "nixos-lite";
in
{
  flake.nixosConfigurations = inputs.self.lib.mkNixos "x86_64-linux" "${hostName}";

  flake.modules.nixos."${hostName}" = {

    networking.hostName = "${hostName}";

    imports = with inputs.self.modules.nixos; [
      bootloader
      brightnessctl
      cli-tools-advanced
      mdns
      system-desktop
      twingate
      zach
    ];

    home-manager.users.zach = {
      imports = with inputs.self.modules.homeManager; [
        cli-tools-advanced
        remmina
        system-desktop
        zach
      ];
    };

  };
}
