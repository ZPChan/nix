{
  flake.modules.nixos.fzf =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        fzf
      ];
    };
}
