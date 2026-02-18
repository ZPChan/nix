{
  flake.modules.nixos.ghostty =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        ghostty
      ];
    };

  flake.modules.homeManager.ghostty = {
    programs.ghostty = {
      enable = true;
      settings = {
        font-family = "CaskaydiaCove Nerd Font";
        gtk-titlebar = false;
        background-opacity = 0.9;
        shell-integration-features = "ssh-terminfo,ssh-env";
      };
    };
  };
}
