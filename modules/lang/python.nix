{
    flake.modules.lang.python = {
        plugins = {
            conform-nvim.settings = {
                formatters_by_ft.python = ["isort" "black"];
                formatters = {
                    black.prepend_args = ["--fast"];
                    isort.prepend_args = ["--profile" "black"];
                };
            };
            lsp.servers.pyright.enable = true;
            neo-tree.settings.filesystem.filteredItems.hideByName = [
                "__init__.py"
                "__main__.py"
            ];
        };
    };
}
