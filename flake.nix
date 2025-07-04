{
  description = "My first flake!";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            ./system/configuration.nix
            /etc/nixos/hardware-configuration.nix
          ];
        };
      };
      homeConfigurations = {
        gusjengis = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./user/home.nix ];
        };
      };
    };
}
