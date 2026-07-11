{ inputs, ... }:
{
  flake.modules.nixos.cli-tools-advanced =
    { pkgs, ... }:
    {
      imports = with inputs.self.modules.nixos; [
        git
        nushell
        cli-tools-basic
      ];

      users.users.zach = {
        shell = pkgs.nushell;
      };
    };

  flake.modules.homeManager.cli-tools-advanced = {
    imports = with inputs.self.modules.homeManager; [
      git
      lazyvim
      nushell
      starship
      tmux
      yazi
      zsh
    ];
  };
}
