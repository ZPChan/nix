{
  flake.modules.nixos.libreoffice =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        libreoffice-qt
        hunspell
        hunspellDicts.en-us
        hyphenDicts.en-us
      ];
    };
}

