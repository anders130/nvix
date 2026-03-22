{
    plugins = {
        cmp = {
            enable = true;
            settings = {
                completion.completeopt = "menu,menuone,noinsert";
                # TODO: try to configure this in a more nix-like way (https://nix-community.github.io/nixvim/plugins/cmp/settings/index.html#pluginscmpsettingsmapping)
                mapping.__raw = /*lua*/''cmp.mapping.preset.insert({
                    ['<C-n>'] = cmp.mapping.select_next_item(),
                    ['<C-p>'] = cmp.mapping.select_prev_item(),
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-ü>'] = cmp.mapping.complete {},
                })'';
                sources = [
                    { name = "nvim_lsp"; }
                    { name = "path"; }
                    { name = "buffer"; }
                    { name = "supermaven"; }
                ];
            };
        };
        cmp-nvim-lsp.enable = true;
        cmp-path.enable = true;
        cmp-buffer.enable = true;
    };
}
