{
  inputs,
  nixpkgs,
  home-manager,
  stable,
  ...
}: let
  system = "x86_64-linux";

  # Define your infrastructure inventory here
  hostsConfig = {
    # LaptopConfig
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
        ./${hostName}/hardware-configuration.nix
        ../modules/core/core.nix
        inputs.stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {inherit system inputs stable hostName;};
            users = nixpkgs.lib.genAttrs hostData.users (
              userName:
                import (../modules/home + "/${userName}/home.nix")
            );
          };
        }
      ];
    };
in
  nixpkgs.lib.mapAttrs (hostName: hostData: mkHost hostName hostData) hostsConfig
