{
    plugins = {
        lsp.servers = {
            ts_ls.enable = true;
            eslint.enable = true;
            vtsls.enable = true; # vue
        };
        none-ls.sources.formatting.prettier = {
            enable = true;
            disableTsServerFormatter = true;
        };
    };
}
