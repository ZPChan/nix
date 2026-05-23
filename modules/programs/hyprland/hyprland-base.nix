{ inputs, ... }:
{
  flake.modules.nixos.hyprland-base =
    { pkgs, ... }:
    {
      imports = with inputs.self.modules.nixos; [
        kitty
      ];

      environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
      };

      programs.hyprland = {
        enable = true;
        xwayland.enable = true;
      };

      xdg.portal = {
        enable = true;
        extraPortals = with pkgs; [ 
          xdg-desktop-portal-gtk 
        ];
      };

      environment.systemPackages = with pkgs; [
        libnotify
        grim
        slurp
        satty
        hyprshutdown
      ];

      services.udisks2.enable = true;

      fonts.packages = with pkgs; [
        font-awesome
      ];
    };

  flake.modules.homeManager.hyprland-base =
    { pkgs, ... }:
    {
      wayland.windowManager.hyprland = {
        enable = true;
        systemd.enable = false;
      };

      gtk = {
        enable = true;
        theme = {
          package = pkgs.magnetic-catppuccin-gtk.override {
            size = "compact";
          };
          name = "Catppuccin-GTK-Dark-Compact";
        };
      };

      services.udiskie = {
        enable = true;
        settings = {
          # workaround for
          # https://github.com/nix-community/home-manager/issues/632
          program_options = {
            file_manager = "${pkgs.ghostty}/bin/ghostty -e ${pkgs.yazi}/bin/yazi";
          };
        };
      };
    };

}

