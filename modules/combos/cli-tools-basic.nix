{ inputs, ... }:
{
  flake.modules.nixos.cli-tools-basic = {
    imports = with inputs.self.modules.nixos; [
      bash
      nvim
      tmux
      yazi
      zsh
    ];
  };
}
