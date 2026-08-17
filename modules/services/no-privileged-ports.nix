{
  flake.modules.nixos.no-privileged-ports = {
    boot.kernel.sysctl = {
      "net.ipv4.ip_unprivileged_port_start" = 0;
    };
  };
}
