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
          echo "Accessing secrets..."
          apiKey=$(cat ${config.sops.secrets."telegram/apiKey".path})
          chatId=$(cat ${config.sops.secrets."telegram/chatId".path})

          echo "Curling..."

          ${pkgs.curl}/bin/curl -X POST "https://api.telegram.org/bot$apiKey/sendMessage" -d "chat_id=$chatId&text=Hello"
        '';
        serviceConfig = {
          Type = "oneshot";
          User = "root";
        };
      };
    };
}
