{
  flake.modules.homeManager.zoxide = {
    programs.zoxide = {
      enable = true;
    };
    programs.bash.bashrcExtra = ''
      eval "$(zoxide init bash)"
    '';
  };
}
