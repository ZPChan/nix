{
  flake.modules.nixos.xserver = {
    services.xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };
    services.displayManager.gdm.enable = true;
  };
}
