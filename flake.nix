{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    catppuccin.url = "github:catppuccin/nix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixos-wsl,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        nixos-lite = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs system;
          };
          modules = [
            ./hosts/nixos-lite/configuration.nix
            inputs.home-manager.nixosModules.default
            inputs.catppuccin.nixosModules.catppuccin
          ];
        };
        nixos-wsl = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs system;
          };
          system = "${system}";
          modules = [
            ./hosts/nixos-wsl/configuration.nix
            nixos-wsl.nixosModules.default
            inputs.home-manager.nixosModules.default
            inputs.catppuccin.nixosModules.catppuccin
          ];
        };
      };
    };
}
