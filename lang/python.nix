{
    plugins = {
        conform-nvim.settings.formatters_by_ft.python = ["isort" "black"];
        lsp.servers.pyright.enable = true;
        neo-tree.filesystem.filteredItems.hideByName = [
            "__init__.py"
            "__main__.py"
        ];
    };
}
