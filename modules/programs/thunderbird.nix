{
  flake.modules.nixos.thunderbird =
    { pkgs, ... }:
    {
      programs.thunderbird = {
        enable = true;
      };
    };
}

