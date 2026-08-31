{
  flake.modules.nixos.telegram-notify-start =
    { pkgs, config, ... }:
    {

      sops.secrets."telegram/apiKey" = { };
      sops.secrets."telegram/chatId" = { };

      systemd.services.telegram-notify-start = {
        enable = true;
        description = "Send start message to Telegram";
        after = [ "network-online.target" ];
        wants = [ "network-online.target" ];
        wantedBy = [ "multi-user.target" ];
        script = ''
          apiKey=$(cat ${config.sops.secrets."telegram/apiKey".path})
          chatId=$(cat ${config.sops.secrets."telegram/chatId".path})

          ${pkgs.curl}/bin/curl -X POST "https://api.telegram.org/bot$apiKey/sendMessage" -d "chat_id=$chatId" --data-urlencode "text=From $HOSTNAME: Started!"
        '';
        serviceConfig = {
          Type = "oneshot";
          User = "root";
        };
      };
    };
}
