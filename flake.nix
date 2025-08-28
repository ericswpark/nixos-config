{
  description = "NixOS flake for ericswpark";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      plasma-manager,
      nix-index-database,
      ...
    }:
    {
      nixosConfigurations = {
        stanford = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/stanford/configuration.nix
            nix-index-database.nixosModules.nix-index

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ];

              home-manager.users.ericswpark = import ./hosts/stanford/home-manager.nix;
            }
          ]; # End of modules
        }; # End of stanford config
        wendy = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/wendy/configuration.nix
            nix-index-database.nixosModules.nix-index

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ];

              home-manager.users.ericswpark = import ./hosts/wendy/home-manager.nix;
            }
          ]; # End of modules
        }; # End of wendy config
        dipproxy = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/dipproxy/configuration.nix


            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.ericswpark = import ./hosts/dipproxy/home-manager.nix;
            }
          ]; # End of modules
        }; # End of dipproxy config
      }; # End of NixOS configurations
    }; # End of outputs
}
