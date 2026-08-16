{
  inputs,
  ...
}:
let
  hostName = "zelda-laptop";
in
{
  flake.nixosConfigurations = inputs.self.lib.mkNixos "x86_64-linux" "${hostName}";

  flake.modules.nixos."${hostName}" = {

    networking.hostName = "${hostName}";

    imports = with inputs.self.modules.nixos; [
      bootloader
      brightnessctl
      mdns
      nextcloud
      ssh
      system-kids
      wifi
      zach
      zelda
      zelda-auto-login
    ];

    home-manager.users.zach = {
      imports = with inputs.self.modules.homeManager; [
        system-minimal
        zach
      ];
    };
    home-manager.users.zelda = {
      imports = with inputs.self.modules.homeManager; [
        system-kids
        zelda
      ];
    };

  };
}
