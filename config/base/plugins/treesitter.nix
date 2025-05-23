{
    filetype = {
        extension = {
            rasi = "rasi";
            tmux = "tmux";
        };
        pattern.".*/hypr/.*%.conf" = "hyprlang";
    };

    plugins.treesitter = {
        enable = true;
        settings = {
            highlight.enable = true;
            indent.enable = true;
        };
        nixvimInjections = true;
    };
}
