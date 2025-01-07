{
    description = "Nixvim flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        nvf.url = "github:notashelf/nvf";
        flake-parts.url = "github:hercules-ci/flake-parts";
        systems.url = "github:nix-systems/default";
        modulix = {
            url = "github:anders130/modulix";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = inputs:
        inputs.flake-parts.lib.mkFlake {inherit inputs;} {
            imports = [./pkgs.nix];
            systems = import inputs.systems;
        };
}
