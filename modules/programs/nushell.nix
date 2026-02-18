{
  flake.modules.nixos.nushell =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        nushell
        vivid
      ];
      programs.tmux.extraConfig = ''
        set-option -g default-shell ${pkgs.nushell}/bin/nu
      '';
    };
  flake.modules.homeManager.nushell = {
    programs.nushell = {
      enable = true;
      extraConfig = ''
        $env.LS_COLORS = (vivid generate catppuccin-mocha)
        $env.config.edit_mode = 'vi'
        $env.config.buffer_editor = 'nvim'
        $env.config.show_banner = false
      '';
    };
    catppuccin.nushell.enable = true;
  };
}
