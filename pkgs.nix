{inputs, ...}: {
    perSystem = {pkgs, ...}: let
        mkPackage = config:
            (inputs.nvf.lib.neovimConfiguration {
                inherit pkgs;
                modules = [config] ++ (inputs.modulix.lib.mkModules ./modules);
            })
            .neovim;
    in {
        packages = rec {
            base = mkPackage {
                modules.bundles.base.enable = true;
            };
            full = mkPackage {
                modules.bundles = {
                    base.enable = true;
                    full.enable = true;
                };
            };
            default = base;
        };
    };
}
