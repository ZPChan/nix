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

    services.displayManager.autoLogin = {
      enable = true;
      user = "zelda";
    };

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
    ];

    home-manager.users.zach = {
      imports = with inputs.self.modules.homeManager; [
        system-kids
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
