{
  flake.modules.nixos = {
    ssh = {
      services.openssh = {
        enable = true;
        openFirewall = true;
        settings = {
          PermitRootLogin = "no";
          PasswordAuthentication = false;
          KbdInteractiveAuthentication = false;
          MaxAuthTries = 3;
          PerSourcePenalties = "crash:3600s authfail:3600s max:86400s";
        };
      };
    };

    ssh-wsl = {
      services.openssh = {
        enable = true;
        ports = [ 2222 ];
        openFirewall = true;
        settings = {
          PermitRootLogin = "no";
          PasswordAuthentication = true;
          MaxAuthTries = 10;
          PerSourcePenalties = "crash:3600s authfail:3600s max:86400s";
        };
      };
    };

    ssh-pw-auth = {
      services.openssh = {
        enable = true;
        openFirewall = true;
        settings = {
          PermitRootLogin = "no";
          PasswordAuthentication = true;
          MaxAuthTries = 10;
          PerSourcePenalties = "crash:3600s authfail:3600s max:86400s";
        };
      };
    };
  };
}
