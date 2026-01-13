{
  description = "KoterOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
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
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
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
    globals = {
      UserName = "pim";
      HostName = "NixBTW";
      GitName = "PimKoter";
      GitEmail = "Pim@Koter";
    };
  in {
    nixosConfigurations.NixBTW = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {inherit globals system inputs;};
      modules = [
        ./modules/core/default.nix
        inputs.stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {inherit globals system inputs;};
            users.pim = import ./modules/home/home.nix;
          };
        }
      ];
    };
  };
}
