{
    plugins = {
        typst-vim.enable = true;
        lsp.servers.tinymist = {
            enable = true;
            settings.formatterMode = "typstyle";
        };
        web-devicons.customIcons.typ = {
            icon = "";
            color = "#5acede";
            name = "typst";
        };
    };
}
