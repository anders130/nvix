{pkgs, ...}: let
    inherit (pkgs.vimPlugins) vim-tmux-navigator;
in {
    modules = {
        plugins = {
            neo-tree.enable = true;
            nvim-cmp.enable = true;
            statusline.enable = true;
        };
        languages.enable = true;
        theme.enable = true;
    };
    vim = {
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
        extraPlugins = {
            vim-tmux-navigator.package = vim-tmux-navigator;
        };
    };
}
