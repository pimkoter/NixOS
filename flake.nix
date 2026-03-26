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
      url = "github:danth/stylix";
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
    userdata = {
      user = "pim";
      host = "NixBTW";
    };
  in {
    nixosConfigurations.NixBTW = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {inherit userdata system inputs stable;};
      modules = [
        ./modules/core/core.nix
        inputs.stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {inherit userdata system inputs;};
            users.pim = import ./modules/home/home.nix;
          };
        }
      ];
    };
  };
}
