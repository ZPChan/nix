{
  flake.modules.nixos.git =
    { pkgs, ... }:
    {
      programs.git.enable = true;
      environment.systemPackages = with pkgs; [
        git
        gh
      ];
    };

  flake.modules.homeManager.git = {
    programs.git = {
      enable = true;
      settings = {
        init.defaultBranch = "main";
        difftool.prompt = true;
        diff.tool = "nvimdiff";
        difftool."nvimdiff".cmd = "nvim -d \"$LOCAL\" \"$REMOTE\"";
      };
    };
  };
}
