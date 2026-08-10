{
  flake.modules.nixos.can-wake-on-wlan =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        iw
      ];
      systemd.services.wowlan = {
        enable = true;
        description = "Enables Wake on WLan (wifi)";
        requires = [ "network.target" ];
        after = [ "network.target" ];
        wantedBy = [ "multi-user.target" ];
        serviceConfig = {
          ExecStart = "${pkgs.iw}/bin/iw phy0 wowlan enable magic-packet disconnect";
          Type = "oneshot";
        };
      };
    };
}
