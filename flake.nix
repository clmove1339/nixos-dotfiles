{
  description = "clmove's NixOS dotfiles";

  inputs = {
    # NixOS packages source - stable 25.11 branch
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";

    # Home Manager - enables managing user configurations declaratively
    home-manager = {
      url = "github:nix-community/home-manager?ref=release-25.11";
      # Make home-manager use the same nixpkgs as the system
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    # Import all inputs for use in the configuration
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      # System architecture - x86_64 Linux
      system = "x86_64-linux";
      # Username for the home-manager configuration
      username = "clmove";
    in
    {
      # Define the NixOS system configuration for the laptop
      nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
        # Pass inputs to modules
        specialArgs = { inherit inputs; };

        # List of modules to build the system
        modules = [
          # Host-specific configuration
          ./hosts/laptop/configuration.nix

          # Enable Home Manager
          home-manager.nixosModules.home-manager
          {
            # Use globally pinned packages from nixpkgs
            home-manager.useGlobalPkgs = true;
            # Enable user-specific packages
            home-manager.useUserPackages = true;

            # Pass inputs to home-manager modules
            home-manager.extraSpecialArgs = { inherit inputs; };

            # Import the home configuration from modules/default.nix
            home-manager.users.${username} = import ./modules;
          }
        ];
      };
    };
}
