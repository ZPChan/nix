{
  flake.modules.homeManager.music-notation =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        lilypond
        frescobaldi
      ];
    };
}
