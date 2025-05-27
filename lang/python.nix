{lib, ...}: {
    plugins = {
        conform-nvim.settings.formatters_by_ft.python = ["isort" "black"];
        lsp.servers.pyright.enable = true;
        neo-tree.filesystem.filteredItems.hideByName = [
            "__init__.py"
            "__main__.py"
        ];
        molten = {
            enable = true;
            settings = {
                image_provider = "image.nvim";
                output_crop_border = true;
                output_virt_lines = false;
                output_win_border = ["" "━" "" ""];
                auto_image_popup = false;
            };
        };
    };
    keymaps = lib.mkMerge [
        # Normal mode mappings
        (lib.mapAttrsToList (key: action: {
            mode = "n";
            options.silent = true;
            inherit action key;
        }) {
            "<localleader>Mi" = ":MoltenInit<CR>";
            "<localleader>rr" = ":MoltenReevaluateCell<CR>";
            "<localleader>rl" = ":MoltenEvaluateLine<CR>";
            "<localleader>rd" = ":MoltenDelete<CR>";
            "<localleader>ro" = ":MoltenEvaluateOperator<CR>"; # replaced <localleader>e to avoid conflict
            "<localleader>oh" = ":MoltenHideOutput<CR>";
            "<localleader>oo" = ":noautocmd MoltenEnterOutput<CR>";
        })
        [
            {
                key = "<localleader>r";
                action = ":<C-u>MoltenEvaluateVisual<CR>gv";
                mode = "v";
                options.silent = true;
            }
        ]
    ];
}
