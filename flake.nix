{
  description = "KoterOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stable.url = "github:nixos/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    helium-browser = {
      url = "github:AlvaroParker/helium-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    ...
  }: let
    system = "x86_64-linux";

    stable = import inputs.stable {
      inherit system;
      config.allowUnfree = true;
    };

    # Define your infrastructure inventory here
    hostsConfig = {
      NixBTW = {
        users = ["pim"];
      };
      # To add more machines in the future, just uncomment and modify:
      # LaptopBTW = {
      #   users = [ "pim" "alice" ];
      # };
    };

    mkHost = hostName: hostData:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit system inputs hostName stable;};
        modules = [
          ./hosts/${hostName}/hardware-configuration.nix
          ./modules/core/core.nix
          ./modules/core/plymouth.nix # Ensuring your fresh Breeze animation is imported!
          inputs.stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {inherit system inputs stable hostName;};
              users = nixpkgs.lib.genAttrs hostData.users (
                userName:
                  import (./modules/home + "/${userName}/home.nix")
              );
            };
          }
        ];
      };
  in {
    nixosConfigurations = nixpkgs.lib.mapAttrs (hostName: hostData: mkHost hostName hostData) hostsConfig;
  };
}
