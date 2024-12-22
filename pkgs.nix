{
    inputs,
    self,
    ...
}: {
    perSystem = {pkgs, system, ...}: let
        lib = inputs.nixvim.lib.nixvim.extendedLib // (import ./lib);
        extraSpecialArgs = {
            inherit inputs lib;
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
