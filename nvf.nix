{pkgs, ...}: let
    inherit (pkgs.vimPlugins) vim-tmux-navigator;
in {
    vim = {
        theme = {
            enable = true;
            name = "catppuccin";
            style = "macchiato";
            transparent = true;
        };

        filetree.neo-tree = {
            enable = true;
            setupOpts.window = {
                position = "right";
                mappings."<space>" = "none";
            };
        };

        statusline.lualine = {
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
        autocomplete.nvim-cmp.enable = true;
        ui.noice.enable = true; # nicer command prompt
        notify.nvim-notify.enable = true;
        git = {
            enable = true;
            gitsigns.enable = true;
        };

        binds = {
            whichKey.enable = true;
            cheatsheet.enable = false;
        };
        comments.comment-nvim.enable = true;
        telescope.enable = true;

        languages = {
            rust.enable = true;
            nix = {
                enable = true;
                lsp.enable = true;
            };
            python.enable = true;
            ts.enable = true;
            markdown.enable = true;
            html.enable = true;
        };
        extraPlugins = {
            vim-tmux-navigator.package = vim-tmux-navigator;
        };
    };
}
