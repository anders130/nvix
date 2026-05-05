{
    flake.modules.ui.statusline = {
        plugins.lualine = {
            enable = true;
            settings.sections.lualine_c = [
                {
                    __unkeyed-1 = "filename";
                    path = 1;
                    shorting_target = 40;
                }
            ];
            settings.options = {
                section_separators = {
                    left = "";
                    right = "";
                };
                component_separators = {
                    left = "";
                    right = "";
                };
            };
        };
    };
}
