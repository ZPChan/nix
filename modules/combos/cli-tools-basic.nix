{ inputs, ... }:
{
  flake.modules.nixos.cli-tools-basic = {
    imports = with inputs.self.modules.nixos; [
      nushell
      git
      nvim
      tmux
      yazi
      zsh
    ];
  };
  flake.modules.homeManager.cli-tools-basic = {
    imports = with inputs.self.modules.homeManager; [
      nushell
      git
      tmux
      yazi
      zsh
    ];
  };
}
