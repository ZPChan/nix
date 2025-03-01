{ pkgs, lib, config, ... }: {
  options = {
    programs.suid.enable = lib.mkEnableOption "enables suid module";
  };
  config = lib.mkIf config.programs.suid.enable {
    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    programs.mtr.enable = true;
    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
}

