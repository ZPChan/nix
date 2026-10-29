{ inputs, ... }:
{
  flake.modules.nixos.cli-tools-advanced = {
    imports = with inputs.self.modules.nixos; [
      fzf
      git
      nushell
      cli-tools-basic
      devenv
      superfile
    ];
  };

  flake.modules.homeManager.cli-tools-advanced = {
    imports = with inputs.self.modules.homeManager; [
      bash
      devenv
      git
      lazyvim
      nushell
      starship
      superfile
      tmux
      yazi
      zoxide
      zsh
    ];
  };
}
