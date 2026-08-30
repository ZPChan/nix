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
        wantedBy = [ "multi-user.target" ];
        serviceConfig = {
          Type = "oneshot";
          User = "root";
          ExecStart = "${pkgs.writeShellScript "telegram-notify-start.sh" ''

            apiKey=$(${config.sops.secrets."telegram/apiKey".path})
            chatId=$(${config.sops.secrets."telegram/chatId".path})

            curl -X POST "https://api.telegram.org/bot''$apiKey/sendMessage" -d "chat_id=''$chatId&text=Hello"

          ''}";
        };
      };
    };
}
