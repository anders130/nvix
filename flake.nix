{
    description = "Nixvim flake";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";
        flake-parts.url = "github:hercules-ci/flake-parts";
        systems.url = "github:nix-systems/default-linux";
        nixvim = {
            url = "github:nix-community/nixvim";
            inputs = {
                nixpkgs.follows = "nixpkgs";
                flake-parts.follows = "flake-parts";
                systems.follows = "systems";
                nuschtosSearch.inputs.flake-utils.inputs.systems.follows = "systems";
            };
        };
    };

    outputs = inputs:
        inputs.flake-parts.lib.mkFlake {inherit inputs;} {
            imports = [./pkgs.nix];
            systems = import inputs.systems;
        };
}
