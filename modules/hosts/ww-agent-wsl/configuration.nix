{
  inputs,
  ...
}:
let
  hostName = "ww-agent-wsl";
in
{
  flake.nixosConfigurations = inputs.self.lib.mkNixos "x86_64-linux" "${hostName}";

  flake.modules.nixos."${hostName}" = {
    wsl.defaultUser = "ai-agent";

    imports = with inputs.self.modules.nixos; [
      autoUpgrade-allowReboot
      cli-tools-advanced
      system-wsl
      azure-cli
      nix-ld
      ai-agent
      ai-agent-default-shell-zsh
    ];

    users.users."ai-agent".uid = 1001;

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
