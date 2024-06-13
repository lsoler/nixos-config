{
    description = "A simple NioxOS flake";

    inputs = {
    	# NixOS official package source, using the nixos-24.05 branch here
	nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    };

    outputs = { self, nixpkgs, ...}@inputs: {
	nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
		system = "x86_64-linux";
		modules = [
			# Import the previous configuration.nix we used,
			# so the old configuration file still takes effect
			./configuration.nix
		];
	};
    };
}
