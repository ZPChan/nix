{
  flake.modules.nixos.displaymanager = {
    services.displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
  };
}
