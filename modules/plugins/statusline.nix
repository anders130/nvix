{
    vim.statusline.lualine = {
        enable = true;
        theme = "catppuccin";
        activeSection.b = [
            ''
                {
                    "mode",
                    icons_enabled = true,
                    separator = {
                        left = "",
                        right = ""
                    },
                }
            ''
            ''
                {
                    draw_empty = true,
                    separator = {
                        left = "",
                        right = ""
                    },
                }
            ''
        ];
        # setupOpts = {
        #     section_separators = {
        #         left = "";
        #         right = "";
        #     };
        #     component_separators = {
        #         left = "";
        #         right = "";
        #     };
        # };
    };
}
