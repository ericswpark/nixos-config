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
  };

  outputs = { self,
              nixpkgs,
              home-manager,
              plasma-manager,
              ...
            }: {
    nixosConfigurations = {
      wendy = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/wendy/configuration.nix
          
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ];

            home-manager.users.ericswpark = import ./home-manager/home.nix;
          }
        ]; # End of modules
      }; # End of wendy config
      dipclone = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/dipclone/configuration.nix
        ]; # End of modules
      }; # End of dipclone config
    }; # End of NixOS configurations
  }; # End of outputs
}
