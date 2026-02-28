{

  description = "Master flake for zora";

  inputs = {

    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-25.11";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    cider = {
      url = "/home/bnk/programs/cider-2";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zed-extensions = {
      url = "github:DuskSystems/nix-zed-extensions";
    };

  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    {
      nixosConfigurations = {

        zora = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          system = "x86_64-linux";

          modules = [
            ./system/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                extraSpecialArgs = { inherit inputs; };
                useGlobalPkgs = true;
                useUserPackages = true;
                sharedModules = [ zed-extensions.homeManagerModules.default ];
                users.bnk = ./home/home.nix;
              };
            }

          ];

        };
      };
    };
}
