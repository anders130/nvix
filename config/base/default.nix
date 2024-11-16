{lib, ...}: {
    imports = lib.importFromDir ./.;

    performance.byteCompileLua = {
        enable = true;
        nvimRuntime = true;
    };

    extraConfigLua = /*lua*/''
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
}
