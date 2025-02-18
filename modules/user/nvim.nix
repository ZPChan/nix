{ pkgs, lib, config, ... }: {
  options = {
    nvim.enable = lib.mkEnableOption "enables nvim module";
  };
  config = lib.mkIf config.nvim.enable {
    environment.systemPackages = [
      pkgs.vimPlugins.LazyVim
    ];
  };
}

