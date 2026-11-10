{
  flake.modules.nixos.claude-code = 
    { pkgs, ...}:
    {
      environment.systemPackages = with pkgs; [
        bubblewrap
        socat
      ];

      environment.etc."claude-code/managed-settings.json".text = builtins.toJSON {
        sandbox = {
          enabled = true;
          failIfUnavailable = true;
          allowUnsandboxedCommands = false;
        };
        permissions = {
          deny = [
            "Read(./.env)"
            "Read(./secrets/**)"
          ];
          disableBypassPermissionsMode = "disable";
        };
        allowManagedPermissionRulesOnly = true;
      };
    };

  flake.modules.homeManager.claude-code = {
    programs.claude-code = {
      enable = true;
    };
  };

}
