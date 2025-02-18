{ pkgs, lib, config, ... }: {
  options = {
    nvim.enable = lib.mkEnableOption "enables nvim module";
  };
  config = lib.mkIf config.nvim.enable {
    environment.systemPackages = with pkgs; [
      neovim
      wl-clipboard
      kanata
      gcc
    ];
    fonts.packages = with pkgs; [
      nerd-fonts.fira-code
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

