{
  description = "Personal environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixpkgs-unstable, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      # Required to have nvim 0.12, is not in stable release
      pkgsUnstable = nixpkgs-unstable.legacyPackages.${system};
    in
    {
      homeConfigurations."ubuntu" =
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          extraSpecialArgs = {
            inherit pkgsUnstable;
          };

          modules = [
            ./hosts/ubuntu.nix
          ];
        };
    };
}
