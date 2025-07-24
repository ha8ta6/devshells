{
  description = "ha8ta6's development shell templates.";

  outputs =
    inputs@{
      flake-parts,
      systems,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      perSystem =
        {
          pkgs,
          ...
        }:
        {
          devShells.default = pkgs.mkShellNoCC {
          };
        };

      # Used nix-systems to improve maintainability and readability.
      # If you want to change the supported systems, change `inputs.systems.url`.
      systems = import systems;
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    systems = {
      url = "github:nix-systems/default-linux";
      flake = false;
    };
  };
}
