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
    LazyVim = {
      url = "github:matadaniel/LazyVim-module";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvim-treesitter-main.url = "github:iofq/nvim-treesitter-main";
    arion.url = "github:hercules-ci/arion";
  };
  nixConfig = {
    extra-substituters = [
      "https://nvim-treesitter-main.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nvim-treesitter-main.cachix.org-1:cbwE6blfW5+BkXXyeAXoVSu1gliqPLHo2m98E4hWfZQ="
    ];
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
      pkgs = import nixpkgs.legacyPackages.${system} {
        inherit system;
        overlays = [
          inputs.nvim-treesitter-main.overlays.default
          (final: prev: {
            vimPlugins = prev.vimPlugins.extend (
              f: p: {
                nvim-treesitter = p.nvim-treesitter.withAllGrammars; # or withPlugins...
                # also redefine nvim-treesitter-textobjects (any other plugins that depend on nvim-treesitter)
                nvim-treesitter-textobjects = p.nvim-treesitter-textobjects.overrideAttrs {
                  dependencies = [ f.nvim-treesitter ];
                };
              }
            );
          })
        ];
      };
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
        timberlane-server = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs system;
          };
          modules = [
            ./hosts/timberlane-server/configuration.nix
            inputs.home-manager.nixosModules.default
            inputs.catppuccin.nixosModules.catppuccin
          ];
        };
      };
    };
}
