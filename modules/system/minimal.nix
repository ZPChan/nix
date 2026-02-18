{
  flake.modules.nixos.system-minimal = {
    nixpkgs.config.allowUnfree = true;
    system.stateVersion = "25.05";

    nix.settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];

      trusted-users = [
        "root"
        "@wheel"
      ];
    };
  };

  flake.modules.homeManager.system-minimal = {
    home.stateVersion = "25.05";
  };
}
