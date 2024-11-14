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
            systems = import inputs.systems;
            perSystem = {pkgs, system, ...}: let
                nixvimLib = inputs.nixvim.lib.${system};
                lib = nixvimLib.helpers.extendedLib // (import ./lib);
                extraSpecialArgs = {
                    inherit inputs lib;
                    inherit (inputs.self) opts;
                };
                nixvimModule = {
                    inherit pkgs extraSpecialArgs;
                    module = import ./config;
                };
                nvim = inputs.nixvim.legacyPackages.${system}.makeNixvimWithModule nixvimModule;
            in {
                checks.default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
                packages.default = nvim;
            };
        };
}
