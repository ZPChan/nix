{
  inputs,
  ...
}:
{
  # follow lazyvim installation instructions online
  flake.modules.nixos.lazyvim-deps =
    { pkgs, ... }:
    {
      imports = with inputs.self.modules.nixos; [
        nix-ld
      ];
      environment.systemPackages = with pkgs; [
        cargo
        fd
        fzf
        nodejs_24
        lazygit
      ];
    };
  flake.modules.homeManager.lazyvim-deps = {
    home.file.".config/nvim/lua/plugins/colorscheme.lua".text = ''
      return {
        {
          "LazyVim/LazyVim",
          opts = {
            colorscheme = "catppuccin",
          },
        },
      }
    '';
  };
}
