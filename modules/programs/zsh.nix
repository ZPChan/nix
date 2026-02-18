{
  flake.modules.nixos.zsh =
    { pkgs, ... }:
    {
      programs.zsh.enable = true;
      environment.systemPackages = with pkgs; [
        zsh
      ];
      environment.pathsToLink = [ "/share/zsh" ];
    };

  flake.modules.homeManager.zsh = {
    programs.zsh = {
      enable = true;
      autosuggestion.enable = true;
      antidote = {
        enable = true;
        plugins = [
          "zsh-users/zsh-syntax-highlighting"
          "zsh-users/zsh-autosuggestions"
          "zsh-users/zsh-history-substring-search"
        ];
      };
    };
  };
}
