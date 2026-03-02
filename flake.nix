{

  description = "Master flake for zora";

  inputs = {

    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-25.11";
    };

    dolphin-overlay = {
      url = "github:rumboon/dolphin-overlay";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    cider = {
      url = "/home/bnk/programs/cider-2";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      stylix,
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
            stylix.nixosModules.stylix
          ];
        };
      };
    };
}
