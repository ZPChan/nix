{ lib, ... }:
{
  flake.modules.nixos.devenv =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        devenv
      ];
    };
  flake.modules.homeManager.devenv = {
    programs.zsh.initContent = lib.mkOrder 1000 ''
      eval "$(devenv hook zsh)"
    '';
  };
}
