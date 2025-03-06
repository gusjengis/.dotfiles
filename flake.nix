{
  description = "My first flake!";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    firefox.url = "github:nix-community/flake-firefox-nightly";
    firefox.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url = "github:hyprwm/Hyprland";

  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
          };
          modules = [ ./configuration.nix ];
        };
      };
      homeConfigurations = {
        gusjengis = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home.nix ];
        };
      };
    };
}
