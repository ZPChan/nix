{
  flake.modules.nixos.adguardhome = {

    boot.kernel.sysctl = {
      "net.ipv4.conf.eth0.forwarding" = 1;
    };

    networking.firewall = {
      allowedTCPPorts = [
        53
        5300
        443
        4430
        3000
        8000
        853
        8530
      ];
      allowedUDPPorts = [
        53
        5300
        443
        4430
      ];
      extraCommands = ''
        iptables -A PREROUTING -t nat -p TCP --dport 53 -j REDIRECT --to-port 5300
        iptables -A PREROUTING -t nat -p UDP --dport 53 -j REDIRECT --to-port 5300
        iptables -A PREROUTING -t nat -p TCP --dport 443 -j REDIRECT --to-port 4430
        iptables -A PREROUTING -t nat -p UDP --dport 443 -j REDIRECT --to-port 4430
        iptables -A PREROUTING -t nat -p TCP --dport 853 -j REDIRECT --to-port 8530
      '';
    };
  };
}
