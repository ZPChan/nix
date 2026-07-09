{
  flake.modules.homeManager.vinegar =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        vinegar
      ];
    };
}
