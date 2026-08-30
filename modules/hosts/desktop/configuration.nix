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
      can-wake-on-wlan
      clamav
      cli-tools-advanced
      mdns
      metrics
      nextcloud
      remapcaps
      sops
      ssh
      system-desktop
      twingate
      zach-auto-login
    ];

    sops.secrets.wifi = { };

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
