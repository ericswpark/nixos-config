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
    nixos-06cb-009a-fingerprint-sensor = {
      url = "github:ahbnr/nixos-06cb-009a-fingerprint-sensor";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs,
                     home-manager,
                     plasma-manager,
                     nixos-06cb-009a-fingerprint-sensor,
                     ...
            }: {
    nixosConfigurations = {
      stanford = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/stanford/configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ];

            home-manager.users.ericswpark = import ./home-manager/home.nix;
          }
        ];
      };
      wendy = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/wendy/configuration.nix

          # T480 fingerprint modules
          # https://github.com/ahbnr/nixos-06cb-009a-fingerprint-sensor
          nixos-06cb-009a-fingerprint-sensor.nixosModules.open-fprintd
          nixos-06cb-009a-fingerprint-sensor.nixosModules.python-validity

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ];

            home-manager.users.ericswpark = import ./home-manager/home.nix;
          }
        ];
      };
    };
  };
}
