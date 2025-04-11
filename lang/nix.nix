{
    inputs,
    lib,
    pkgs,
    ...
}: {
    plugins = {
        lsp.servers.nixd = {
            enable = true;
            settings = let flake = /*nix*/''
                builtins.getFlake (builtins.toString ./.)
            ''; in {
                nixpkgs.expr = /*nix*/''
                    (${flake}).inputs.nixpkgs {}
                '';
                options = {
                    nixos.expr = /*nix*/''
                        (${flake}).nixosConfigurations.desktop.options
                    '';
                    packages.expr = /*nix*/''
                        (${flake}).packages.${pkgs.system}.default.options
                    '';
                };
            };
        };
        conform-nvim = {
            ignore_filetypes = ["nix"]; # IMPORTANT: this a custom option
            settings = {
                formatters_by_ft.nix = ["alejandra"];
                formatters.alejandra = {
                    command = lib.getExe inputs.alejandra.defaultPackage.${pkgs.system};
                    args = ["--experimental-config" "${inputs.self}/alejandra.toml"];
                };
            };
        };
    };
}
