{inputs, ...}: {
    imports = [inputs.git-hooks.flakeModule];

    perSystem = {
        config,
        pkgs,
        ...
    }: {
        pre-commit.settings.hooks = {
            alejandra = {
                enable = true;
                package = pkgs.alejandra-with-config;
            };
        };
        devShells.default = config.pre-commit.devShell;
    };
}
