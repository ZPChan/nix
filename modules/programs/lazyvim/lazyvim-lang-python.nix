{
  flake.modules.homeManager.lazyvim-lang-python = {
    programs.lazyvim = {
      extras.lang.python = {
        enable = true;
        installDependencies = true;
      };
    };
  };
}
