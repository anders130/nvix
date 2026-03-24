{
    flake.modules.lang.typescript = {lib, ...}: {
        plugins = {
            lsp.servers = {
                ts_ls.enable = true;
                eslint.enable = true;
                vtsls.enable = true; # vue
            };
            conform-nvim.settings.formatters_by_ft = lib.genAttrs
            [
                "javascript"
                "typescript"
                "javascriptreact"
                "typescriptreact"
                "vue"
                "css"
                "html"
                "json"
            ]
            (_: ["prettier"]);
        };
    };
}
