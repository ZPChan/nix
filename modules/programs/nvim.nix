{
  flake.modules.nixos.nvim =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        wl-clipboard
        wget
        unzip
        ripgrep
        tree-sitter
        gcc
      ];

      programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
      };

      fonts.packages = with pkgs; [
        nerd-fonts.caskaydia-cove
      ];
    };
}
