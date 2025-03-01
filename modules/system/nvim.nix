{ pkgs, lib, config, ... }: {
  options = {
    programs.nvim.enable = lib.mkEnableOption "enables nvim module";
  };
  config = lib.mkIf config.programs.nvim.enable {
    environment.systemPackages = with pkgs; [
      neovim
      wl-clipboard
      kanata
      wget
      unzip
    ];
    fonts.packages = with pkgs; [
      nerd-fonts.caskaydia-cove
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

