{
    autoCmd = [
        {
            desc = "Highlight when yanking text";
            event = ["TextYankPost"];
            callback.__raw = /*lua*/''function()
                vim.highlight.on_yank()
            end'';
        }
        {
            event = ["CursorHold"];
            desc = "Lsp show diagnostics on CursorHold";
            callback.__raw = /*lua*/''function()
                local hover_opts = {
                    focusable = false,
                    close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                    border = "single",
                    source = "always",
                }
                vim.diagnostic.open_float(nil, hover_opts)
            end'';
        }
    ];
}
