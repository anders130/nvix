{
    config,
    inputs,
    ...
}: {
    imports = [inputs.flake-parts.flakeModules.modules];
    systems = import inputs.systems;

    perSystem = {
        pkgs,
        inputs',
        self',
        ...
    }: let
        mkNixvim = module:
            inputs'.nixvim.legacyPackages.makeNixvimWithModule {
                inherit pkgs module;
                extraSpecialArgs = {inherit inputs;};
            };
        modules = config.flake.modules.profiles;
    in {
        packages = {
            base = mkNixvim modules.base;
            full = mkNixvim modules.full;
            default = self'.packages.base;
        };
    };
}
