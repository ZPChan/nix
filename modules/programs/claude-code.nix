{
  flake.modules.nixos.claude-code = 
    { pkgs, ...}:
    {
      environment.systemPackages = with pkgs; [
        bubblewrap
        socat
      ];
    };
  flake.modules.homeManager.claude-code = {
    programs.claude-code = {
      enable = true;
      settings = {
        sandbox = {
          enable = true;
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
      };
    };
  };
}
