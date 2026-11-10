{
  inputs,
  ...
}:
{
  config.flake.factory.ww-agent-wsl = userName: agentName: agentEmail: {

    wsl.defaultUser = "ai-agent";

    imports = with inputs.self.modules.nixos; [
      autoUpgrade-allowReboot
      claude-code
      cli-tools-advanced
      system-wsl
      azure-cli
      nix-ld
      ai-agent
      ai-agent-default-shell-zsh
    ];

    users.users."${userName}" = {
      uid = 1000;
      isNormalUser = true;
      home = "/home/${userName}";
      extraGroups = [
        "wheel"
      ];
    };

    users.users."ai-agent".uid = 1001;

    home-manager.users.ai-agent = {
      imports = with inputs.self.modules.homeManager; [
        claude-code
        cli-tools-advanced
        system-wsl
        ai-agent
      ];

      programs.git.settings.user = {
        name = "${agentName} (AI Agent)";
        email = "${agentEmail}";
      };
    };
  };
}
