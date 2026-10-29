{
  inputs,
  ...
}:
let
  hostName = "nixos-wsl";
in
{
  flake.nixosConfigurations = inputs.self.lib.mkNixos "x86_64-linux" "${hostName}";

  flake.modules.nixos."${hostName}" = {

    networking.hostName = "${hostName}";

    wsl.defaultUser = "zach";

    imports = with inputs.self.modules.nixos; [
      cli-tools-advanced
      system-wsl
      azure-cli
      zach
      zach-default-shell-nushell
      ai-agent
      ai-agent-default-shell-zsh
    ];

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
        herdr
        system-wsl
        ai-agent
      ];
    };
  };
}
