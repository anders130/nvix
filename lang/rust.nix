{pkgs, ...}: {
    plugins = {
        lsp.servers.rust_analyzer = {
            enable = true;
            settings = {
                cargo.features = "all";
                check.command = "clippy";
            };
            # Handled by the flake.nix of the rust project
            installCargo = false;
            installRustc = false;
        };
        conform-nvim.settings.formatters_by_ft.rust = ["rustfmt"];
    };

    extraPackages = [pkgs.rustfmt];
}
