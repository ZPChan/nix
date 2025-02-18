{ pkgs, lib, config, ... }: {
  options = {
    lazyvim.enable = lib.mkEnableOption "enables lazyvim module";
  };
  config = lib.mkIf config.nvim.enable {
    environment.systemPackages = with pkgs; [
      vimPlugins.LazyVim
    ];
  };
}


