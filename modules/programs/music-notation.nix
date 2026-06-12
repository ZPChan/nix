{
  flake.modules.homeManager.music-notation =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        lilypond
        frescobaldi
        soundfont-fluid
      ];

      services.fluidsynth = {
        enable = true;
        soundService = "pipewire-pulse";
      };

      xdg.desktopEntries = {
        frescobaldi = {
          name = "Frescobaldi";
          exec = "frescobaldi";
          terminal = false;
        };
      };
    };
}
