{ inputs, ... }:
{
  flake.modules.nixos.cli-tools-basic = {
    imports = with inputs.self.modules.nixos; [
      nvim
      tmux
      yazi
      zsh
    ];
  };
}
