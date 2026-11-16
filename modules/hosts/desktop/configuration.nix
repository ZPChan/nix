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
      claude-code
      cli-tools-advanced
      herdr-core
      mdns
      metrics
      nextcloud
      remapcaps
      sops
      ssh
      system-desktop
      twingate
      zach
      zach-auto-login
      zach-default-shell-nushell
      ai-agent
      ai-agent-default-shell-zsh
    ];

    home-manager.users.zach = {
      imports = with inputs.self.modules.homeManager; [
        cli-tools-advanced
        herdr-desktop
        herdr
        music-notation
        remmina
        system-desktop
        zach
      ];
    };

    home-manager.users.ai-agent = {
      imports = with inputs.self.modules.homeManager; [
        claude-code
        cli-tools-advanced
        system-minimal
        ai-agent
      ];

      programs.git.settings.user = {
        name = "Zach Putman (AI Agent)";
        email = "23585500+ZPChan@users.noreply.github.com";
      };
    };

  };
}
