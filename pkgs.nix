{
    inputs,
    self,
    ...
}: {
    perSystem = {pkgs, system, lib, ...}: let
        extraSpecialArgs = {
            lib = lib.extend inputs.nixvim.lib.overlay // (import ./lib);
            inherit inputs;
            inherit (inputs.self) opts;
        };
        mkPackage = imports: inputs.nixvim.legacyPackages.${system}.makeNixvimWithModule {
            inherit pkgs extraSpecialArgs;
            module = {inherit imports;};
        };
        baseModules = ["${self}/config/base"];
        fullModules = [
            "${self}/config/full"
            "${self}/lang"
        ];
    in {
        packages = rec {
            base = mkPackage baseModules;
            full = mkPackage (fullModules ++ baseModules);
            default = base;
        };
    };
}
