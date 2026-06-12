{
  flake.modules.nixos.noise-filtering =
    { pkgs, ... }:
    {
      services.pipewire = {
        extraLadspaPackages = [
          pkgs.deepfilternet
        ];
        extraConfig.pipewire = {
          "60-microphone-denoiser" = {
            "context.modules" = [
              {
                name = "libpipewire-module-filter-chain";
                args = {
                  "node.description" = "Headset Microphone (noise suppressed)";
                  "media.name" = "Headset Microphone (noise suppressed)";

                  "filter.graph" = {
                    nodes = [
                      {
                        type = "ladspa";
                        name = "DeepFilter Mono";
                        plugin = "libdeep_filter_ladspa";
                        label = "deep_filter_mono";
                        control = {
                          "Attenuation Limit (dB)" = 100;
                        };
                      }
                    ];
                  };

                  "audio.rate" = 48000;
                  "audio.position" = [ "MONO" ];

                  "capture.props" = {
                    "node.passive" = true;
                    "node.target" = "alsa_input.usb-SteelSeries_Arctis_Nova_Pro_Wireless-00.mono-fallback";
                  };
                  "playback.props"."media.class" = "Audio/Source";
                };
              }
            ];
          };
        };
      };
    };
}
