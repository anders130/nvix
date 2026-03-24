{
    flake.modules.lang.kotlin = {pkgs, ...}: {
        plugins = {
            none-ls.sources.diagnostics.ktlint.enable = true;
            conform-nvim.settings.formatters_by_ft.kotlin = ["ktlint"];
        };

        extraPackages = [pkgs.kotlin-language-server];
        extraConfigLuaPost = ''
            vim.lsp.config("kotlin_language_server", {
                cmd = { "kotlin-language-server" },
                filetypes = { "kotlin" },
                root_dir = function(bufnr, on_dir)
                    local fname = vim.api.nvim_buf_get_name(bufnr)
                    if fname:match("/%.direnv/") or fname:match("/flake%-inputs/") then
                        return
                    end
                    local root = vim.fs.root(bufnr, {
                        "settings.gradle.kts",
                        "settings.gradle",
                        "build.gradle.kts",
                        "build.gradle",
                    })
                    if root then on_dir(root) end
                end,
                before_init = function(params, config)
                    local r = config.root_dir
                    if not r or vim.fn.isdirectory(r .. "/.direnv") ~= 1 then return end
                    local folders = {}
                    local handle = vim.uv.fs_scandir(r)
                    if handle then
                        while true do
                            local name, ftype = vim.uv.fs_scandir_next(handle)
                            if not name then break end
                            if ftype == "directory" and not name:match("^%.") then
                                local sub = r .. "/" .. name
                                if vim.fn.filereadable(sub .. "/build.gradle.kts") == 1
                                    or vim.fn.filereadable(sub .. "/build.gradle") == 1 then
                                    table.insert(folders, { uri = vim.uri_from_fname(sub), name = name })
                                end
                            end
                        end
                    end
                    if #folders > 0 then
                        params.workspaceFolders = folders
                    end
                end,
            })
            vim.lsp.enable("kotlin_language_server")
        '';
    };
}
