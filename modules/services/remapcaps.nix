{
  flake.modules.nixos.remapcaps =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        kanata
      ];

      services.kanata = {
        enable = true;
        keyboards.main.config = ''
          (defsrc caps)
          (deflayer main esc)
        '';
      };
    };
}
