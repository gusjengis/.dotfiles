{
  description = "My first flake!";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inpts.nixpkgs.follotws = "nixpkgs";
    hyprland.url = "github:hyprwm/Hyprland";

  };

  outputs = { self, nixpkgs, ... } @ inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit system;
          modules = [ ./configuration.nix ];
        };
      };
      homeConfigurations = {
        gusjengis = home-manager.lim.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home.nix ];
        };
      };
    };
}
