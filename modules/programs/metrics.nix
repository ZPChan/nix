{
  flake.modules.nixos.metrics =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        btop
        amdgpu_top
      ];
    };
}
