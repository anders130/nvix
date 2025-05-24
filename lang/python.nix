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
    keymaps = lib.mapAttrsToList (key: action: {
        mode = "n";
        options.silent = true;
        inherit action key;
    }) {
        "<localleader>Mi" = ":MoltenInit<CR>";
        "<localleader>e" = ":MoltenEvaluateOperator<CR>";
        "<localleader>rl" = ":MoltenEvaluateLine<CR>";
        "<localleader>rr" = ":MoltenReevaluateCell<CR>";
        "<localleader>r" = ":<C-u>MoltenEvaluateVisual<CR>gv";
        "<localleader>rd" = ":MoltenDelete<CR>";
        "<localleader>oh" = ":MoltenHideOutput<CR>";
        "<localleader>os" = ":noautocmd MoltenEnterOutput<CR>";
    };
}
