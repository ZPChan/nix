{ pkgs, lib, config, ... }: {
  options = {
    nvim.enable = lib.mkEnableOption "enables nvim module";
  };
  config = lib.mkIf config.nvim.enable {
    environment.systemPackages = with pkgs; [
      neovim
      wl-clipboard
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

