{
  inputs,
  ...
}:
let
  hostName = "agent-wsl";
in
{
  flake.nixosConfigurations = inputs.self.lib.mkNixosStable "x86_64-linux" "${hostName}";

  flake.modules.nixos."${hostName}" = {

    networking.hostName = "${hostName}";

    wsl.defaultUser = "ai-agent";

    imports = with inputs.self.modules.nixos; [
      autoUpgrade-allowReboot
      cli-tools-advanced
      system-wsl
      azure-cli
      nix-ld
      zach
      zach-default-shell-nushell
      ai-agent
      ai-agent-default-shell-zsh
    ];

    users.users."zach".uuid = 1000;

    home-manager.users.zach = {
      imports = with inputs.self.modules.homeManager; [
        cli-tools-advanced
        system-wsl
        zach
      ];
    };
    home-manager.users.ai-agent = {
      imports = with inputs.self.modules.homeManager; [
        claude-code
        cli-tools-advanced
        system-wsl
        ai-agent
      ];
    };
  };
}
