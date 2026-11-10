{
  inputs,
  ...
}:
{
  config.flake.factory.ww-agent-wsl = username: agentname: agentemail: {

    networking.hostName = "${username}-agent-wsl";

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

    users.users."${username}" = {
      uid = 1000;
      isNormalUser = true;
      home = "/home/${username}";
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
        name = "${agentname} (AI Agent)";
        email = "${agentemail}";
      };
    };
  };
}
