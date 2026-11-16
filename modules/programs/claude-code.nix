{ lib, ...}:
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

  flake.modules.homeManager.claude-code =
    {pkgs, ...}:
    let
      mattpocockSkills = pkgs.fetchFromGitHub {
        owner = "mattpocock";
        repo = "skills";
        rev = "5863806dd4e15c63174bee4e7515a4256792ecfa";
        hash = "sha256-AYSRCvBL8TDDdW3rgKu2T7gl4YYDoDId0jYbabEFyfs=";
      };

      skillsFrom = skillSet: subfolder:
        lib.mapAttrs (name: _: "${skillSet}/${subfolder}/${name}")
          (lib.filterAttrs (_: type: type == "directory")
            (builtins.readDir "${skillSet}/${subfolder}"));
    in 
    {
      programs.claude-code = {
        enable = true;
        skills =
          skillsFrom mattpocockSkills "skills/engineering"
          // skillsFrom mattpocockSkills "skills/productivity";
      };
    };

}
