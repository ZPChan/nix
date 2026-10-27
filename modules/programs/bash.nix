{
  flake.modules.nixos.bash = {
    programs.bash.enable = true;
  };

  flake.modules.homeManager.bash = {
    programs.bash = {
      enable = true;
    };
  };
}
