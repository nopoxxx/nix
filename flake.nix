{
  description = "nixos config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    daeuniverse.url = "github:daeuniverse/flake.nix";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, nur, ... }:
  let
    system = "x86_64-linux";
    user = "nopox";

    pkgs = import nixpkgs {
      inherit system;
      overlays = [
        nur.overlays.default
      ];
    };
  in
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = {
        inherit user;
      };

      modules = [
        {
          nixpkgs.overlays = [
            nur.overlays.default
          ];

          environment.variables = {
            USER_NAME = user;
          };
        }

        ./profiles/default.nix
        self.inputs.daeuniverse.nixosModules.daed
        home-manager.nixosModules.home-manager

        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit inputs user; };

          home-manager.users.${user} = {
            imports = [
              inputs.spicetify-nix.homeManagerModules.default
              ./home/default.nix
            ];
          };
        }
      ];
    };
  };
}