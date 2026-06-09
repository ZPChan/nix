{
  inputs,
  ...
}:
let
  hostName = "desktop";
in
{
  flake.nixosConfigurations = inputs.self.lib.mkNixos "x86_64-linux" "${hostName}";

  flake.modules.nixos."${hostName}" = {

    networking.hostName = "${hostName}";

    imports = with inputs.self.modules.nixos; [
      bootloader
      brightnessctl
      clamav
      cli-tools-advanced
      mdns
      nextcloud
      remapcaps
      system-desktop
      wifi
      zach
    ];

    home-manager.users.zach = {
      imports = with inputs.self.modules.homeManager; [
        cli-tools-advanced
        music-notation
        remmina
        system-desktop
        zach
      ];
    };

  };
}
