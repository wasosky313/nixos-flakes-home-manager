{
  description = "NixOS from Scratch";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };

  outputs = { self, nixpkgs, home-manager, nix-flatpak, ... }: {
    nixosConfigurations.nixos-wasa = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./host/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.wasa = import ./home-manager/home.nix;
            backupFileExtension = "backup";
            sharedModules = [ nix-flatpak.homeManagerModules.nix-flatpak ];
          };
        }
      ];
    };
  };
}

