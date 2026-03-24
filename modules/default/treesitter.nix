{
    flake.modules.nixvim.default = {pkgs, ...}: {
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

        # splitting/joining codeblocks
        extraPlugins = [pkgs.vimPlugins.treesj];
        extraConfigLuaPre = ''
            require("treesj").setup {
                use_default_keymaps = false,
            }
        '';
        keymaps = [
            {
                mode = "n";
                key = "<leader>m";
                action = "<cmd>TSJToggle<cr>";
            }
        ];
    };
}
