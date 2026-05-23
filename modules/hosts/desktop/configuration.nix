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
      cli-tools-advanced
      mdns
      nextcloud
      remapcaps
      system-desktop
      wifi
      zach
    ];

    home-manager.users.zach = 
    { lib, ...}:
    {
      imports = with inputs.self.modules.homeManager; [
        cli-tools-advanced
        remmina
        system-desktop
        zach
      ];

      wayland.windowManager.hyprland.settings = {
        monitor = lib.mkForce [
          "DP-1,disable"
          "DP-2,preferred,auto,1"
          ",preferred,auto,1"
        ];
      };

    };

  };
}
