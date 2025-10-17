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
  
  };
  
  outputs = inputs@{ nixpkgs, home-manager, ... }: { 
    nixosConfigurations = {
    
      zora = nixpkgs.lib.nixosSystem {
        
        system = "x86_64-linux";
        
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager = { 
              extraSpecialArgs = { inherit inputs; };
              useGlobalPkgs = true;
              useUserPackages = true;
              users.bnk = ./home.nix;
            }; 
          }
          
        ];
        
      };
    };
  };
}
