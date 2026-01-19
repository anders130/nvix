{pkgs, ...}: {
    filetype = {
        extension = {
            rasi = "rasi";
            tmux = "tmux";
        };
        pattern.".*/hypr/.*%.conf" = "hyprlang";
    };

    plugins.treesitter = {
        enable = true;
        highlight.enable = true;
        indent.enable = true;
        nixvimInjections = true;
        grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
    };
}
