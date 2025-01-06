{inputs, ...}: {
    perSystem = {pkgs, ...}: let
        mkPackage =
            (inputs.nvf.lib.neovimConfiguration {
                inherit pkgs;
                modules = [./nvf.nix];
            })
            .neovim;
    in {
        packages = rec {
            base = mkPackage;
            full = mkPackage;
            default = base;
        };
    };
}
