{
    flake.modules.ui.diagnostics = {
        autoCmd = [
            {
                event = ["CursorHold"];
                desc = "Lsp show diagnostics on CursorHold";
                callback.__raw = ''
                    function()
                        local hover_opts = {
                            focusable = false,
                            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                            border = "single",
                            source = "always",
                        }
                        vim.diagnostic.open_float(nil, hover_opts)
                    end
                '';
            }
        ];

        plugins.trouble = {
            enable = true;
            settings = {
                auto_close = true;
                auto_open = false;
            };
        };
        keymaps = [
            {
                mode = "n";
                key = "<leader>xx";
                action = "<cmd>Trouble diagnostics toggle<cr>";
                options.desc = "Diagnostics (Trouble)";
            }
            {
                mode = "n";
                key = "<leader>xX";
                action = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>";
                options.desc = "Buffer Diagnostics (Trouble)";
            }
            {
                mode = "n";
                key = "<leader>cs";
                action = "<cmd>Trouble symbols toggle focus=false<cr>";
                options.desc = "Symbols (Trouble)";
            }
            {
                mode = "n";
                key = "<leader>cl";
                action = "<cmd>Trouble lsp toggle focus=false win.position=right<cr>";
                options.desc = "LSP Definitions / References / ... (Trouble)";
            }
            {
                mode = "n";
                key = "<leader>xL";
                action = "<cmd>Trouble loclist toggle<cr>";
                options.desc = "Location List (Trouble)";
            }
            {
                mode = "n";
                key = "<leader>xQ";
                action = "<cmd>Trouble qflist toggle<cr>";
                options.desc = "Quickfix List (Trouble)";
            }
        ];

        extraConfigLua =
            # lua
            ''
                local signs = {
                    Hint = "󰌶",
                    Info = "",
                    Warn = "",
                    Error = "",
                }

                for type, icon in pairs(signs) do
                    local hl = "DiagnosticSign" .. type
                    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
                end

                vim.diagnostic.config({
                    virtual_text = false,
                    underline = true,
                    signs = true,
                    severity_sort = true,
                    float = {
                        border = "single",
                        source = "always",
                        focusable = false,
                    },
                })
            '';
    };
}
