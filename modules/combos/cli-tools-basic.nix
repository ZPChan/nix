{ inputs, ... }:
{
  flake.modules.nixos.cli-tools-basic =
    { pkgs, ... }:
    {
      imports = with inputs.self.modules.nixos; [
        nushell
        git
        nvim
        tmux
        yazi
        zsh
      ];

      users.users.zach = {
        shell = pkgs.nushell;
      };
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
