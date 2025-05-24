{
    plugins.image = {
        enable = true;
        settings = {
            backend = "kitty";
            max_height_window_percentage.__raw = "math.huge";
            max_width = 100;
            max_width_window_percentage.__raw = "math.huge";
            window_overlap_clear_enabled = true;
            window_overlap_clear_ft_ignore = [
                "cmp_menu"
                "cmp_docs"
                ""
            ];
            integrations.markdown = {
                enabled = true;
                clear_in_insert_mode = true;
                only_render_image_at_cursor = true;
                only_render_image_on_cursor_mode = "popup";
            };
        };
    };
}
