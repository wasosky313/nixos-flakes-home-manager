{
  description = "NixOS from Scratch";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations.nixos-pelu = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./host/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.pelu = import ./home-manager/users/pelu/home.nix;
            users.wasa = import ./home-manager/users/wasa/home.nix;
            backupFileExtension = "backup";
          };
        }
      ];
    };
  };
}

