{
  flake.modules.homeManager.lazyvim-lang-nu = {
    programs.lazyvim = {
      extras.lang.nushell = {
        enable = true;
      };
    };
  };
}
