{
    flake.modules.lang.dart = {
        plugins.flutter-tools = {
            enable = true;
            settings = {
                lsp = {
                    color.enabled = true;
                    capabilities.__raw = ''
                        function(config)
                            return vim.tbl_deep_extend(
                                "force",
                                config,
                                require("cmp_nvim_lsp").default_capabilities()
                            )
                        end
                    '';
                    settings = {
                        showTodos = true;
                        completeFunctionCalls = true;
                        renameFilesWithClasses = "prompt";
                        updateImportsOnRename = true;
                    };
                };
                widget_guides.enabled = true;
                dev_log = {
                    enabled = true;
                    open_cmd = "botright 15split";
                };
                dev_tools.autostart = true;
                closing_tags.enabled = false;
            };
        };

        # handled by per-project dev-shell
        dependencies.flutter.enable = false;

        plugins.neo-tree.settings.filesystem.filteredItems.hideByName = [".dart_tool"];

        extraConfigLuaPost = ''
            require("telescope").load_extension("flutter")
        '';

        keymaps = [
            {
                mode = "n";
                key = "<leader>F";
                action = "<cmd>Telescope flutter commands<cr>";
                options.desc = "[F]lutter commands";
            }
        ];
    };
}
