{ inputs, ... }:
{
  flake-file.inputs = {
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  flake.modules.nixos.zen = {
    environment.systemPackages = [
      inputs.zen-browser.packages."x86_64-linux".default
    ];
  };
}
