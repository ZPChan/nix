{
  flake.modules.nixos.blender =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        blender
      ];
    };
}
