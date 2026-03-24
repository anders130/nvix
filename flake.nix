{
    description = "Nixvim flake";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";
        flake-parts = {
            url = "github:hercules-ci/flake-parts";
            inputs.nixpkgs-lib.follows = "nixpkgs";
        };
        systems.url = "github:nix-systems/default-linux";
        nixvim = {
            url = "github:nix-community/nixvim";
            inputs = {
                nixpkgs.follows = "nixpkgs";
                flake-parts.follows = "flake-parts";
                systems.follows = "systems";
            };
        };
        nix-lib = {
            url = "github:anders130/nix-lib";
            inputs = {
                nixpkgs-lib.follows = "nixpkgs";
                flake-parts.follows = "flake-parts";
            };
        };
    };

    outputs = inputs:
        inputs.nix-lib.lib.mkFlakeFromTree {
            inherit inputs;
            root = ./modules;
        };
}
