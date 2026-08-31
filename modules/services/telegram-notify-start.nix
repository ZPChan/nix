{
  flake.modules.nixos.telegram-notify-start =
    { config, ... }:
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
          echo "Accessing secrets..."
          apiKey=$(cat ${config.sops.secrets."telegram/apiKey".path})
          chatId=$(cat ${config.sops.secrets."telegram/chatId".path})

          echo $(which curl)

          curl -X POST "https://api.telegram.org/bot''$apiKey/sendMessage" -d "chat_id=''$chatId&text=Hello"
        '';
        serviceConfig = {
          Type = "oneshot";
          User = "root";
        };
      };
    };
}
