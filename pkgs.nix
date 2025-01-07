{inputs, ...}: {
    perSystem = {pkgs, ...}: let
        mkPackage = config:
            (inputs.nvf.lib.neovimConfiguration {
                inherit pkgs;
                modules = [
                    (args @ {pkgs, ...}: {
                        inherit (inputs.modulix.lib.mkModules args ./modules) imports;
                    })
                    config
                ];
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
