{
  flake.modules.nixos.system-minimal = {
    nixpkgs.config.allowUnfree = true;
    system.stateVersion = "26.05";

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
    nixpkgs.config.allowUnfree = true;
    home.stateVersion = "26.05";
  };
}
