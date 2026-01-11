{
	description = "nixos config";
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
		home-manager = {
			url = "github:nix-community/home-manager/release-25.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		nixvim = {
			url = "github:nix-community/nixvim/nixos-25.05";
			inputs.nixpkgs.follows = "nixpkgs";

		};
	
	};

	outputs = { nixpkgs, home-manager, nixvim, ...}:
		let 
			system = "x86_64-linux";
		in{
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem{
			inherit system;
			modules = [ ./nixos/configuration.nix ];
		};

		homeConfigurations.tima = home-manager.lib.homeManagerConfiguration {
			pkgs = nixpkgs.legacyPackages.${system};
			modules = [ ./home/home.nix 
				    nixvim.homeModules.nixvim ];
		};
		
	}; 
}
