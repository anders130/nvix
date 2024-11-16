{
    description = "Nixvim flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        nixvim.url = "github:nix-community/nixvim";
        flake-parts.url = "github:hercules-ci/flake-parts";
        systems.url = "github:nix-systems/default";
    };

    outputs = inputs:
        inputs.flake-parts.lib.mkFlake {inherit inputs;} {
            imports = [./pkgs.nix];
            systems = import inputs.systems;
        };
}
