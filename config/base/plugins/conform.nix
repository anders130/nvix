{
    config,
    lib,
    ...
}: let
    cfg = config.plugins.conform-nvim;
in{
    options.plugins.conform-nvim = {
        ignore_filetypes = lib.mkOption {
            type = lib.types.listOf lib.types.str;
            default = [];
            description = "Filetypes to ignore";
        };
    };

    config = {
        keymaps = [{
            mode = ["n" "v"];
            key = "<leader>f";
            action.__raw = /*lua*/''function()
                require('conform').format { async = true, lsp_fallback = true }
            end'';
            options.desc = "[F]ormat buffer";
        }];

        plugins.conform-nvim = {
            enable = true;
            settings = {
                notify_on_error = false;
                format_on_save = /*lua*/''function(bufnr)
                    local disable_filetypes = {
                        ${builtins.concatStringsSep ", " (builtins.map (filetype: "${filetype} = true") cfg.ignore_filetypes)}
                    }

                    if disable_filetypes[vim.bo[bufnr].filetype] then
                        return
                    end

                    return { timeout_ms = 5000, lsp_fallback = true }
                end'';
                formatters = {
                    black.prepend_args = ["--fast"];
                    isort.prepend_args = ["--profile" "black"];
                };
            };
        };
    };
}
