{ inputs, ... }:
{
  flake.modules.nixos.system-bare = {
    imports = with inputs.self.modules.nixos; [
      home-manager
      locale
      sops-nix
      system-minimal
    ];
  };
  flake.modules.homeManager.system-bare = {
    imports = with inputs.self.modules.homeManager; [
      system-minimal
    ];
  };
}
