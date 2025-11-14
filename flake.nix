{
 
  description = "Master flake for zora";

  inputs = {
    
    nixpkgs = {
      url = "github:NixOS/nixpkgs/release-25.05";
    };
   
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    cider = {
      url = "/home/bnk/programs/cider-2";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #pokemon-desolation = {
    # url = "/home/bnk/programs/pokemon-desolation";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};

  };
  
  outputs = { self, nixpkgs, home-manager, ... }@inputs: { 
    nixosConfigurations = {
    
      zora = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        system = "x86_64-linux";
        
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager = { 
              extraSpecialArgs = { inherit inputs; };
              useGlobalPkgs = true;
              useUserPackages = true;
              users.bnk = ./home/home.nix;
            }; 
          }
          
        ];
        
      };
    };
  };
}
