{
  inputs,
  ...
}:
let
  home-manager-config = _: {
    home-manager = {
      verbose = true;
    };
  };
in
{
  flake-file.inputs = {
    home-manager.url = "github:nix-community/home-manager";
  };

  imports = [ inputs.home-manager.flakeModules.home-manager ];

  flake.modules.nixos.home-manager = {
    imports = [
      inputs.home-manager.nixosModules.home-manager
      home-manager-config
    ];
  };

}
