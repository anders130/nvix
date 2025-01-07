{pkgs, ...}: let
    inherit (pkgs.vimPlugins) vim-tmux-navigator;
in {
    modules = {
        plugins = {
            lsp.enable = true;
            neo-tree.enable = true;
        };
        autocomplete.enable = true;
        dashboard.enable = true;
        languages.enable = true;
        notes.enable = true;
        statusline.enable = true;
        theme.enable = true;
        ui.enable = true;
        utility.enable = true;
        visuals.enable = true;
    };
    vim = {
        options = {
            tabstop = 4;
            shiftwidth = 4;
            # expandtab = true;
        };
        viAlias = true;
        vimAlias = true;
        spellcheck.enable = true;
        autopairs.nvim-autopairs.enable = true;
        treesitter.context.enable = true;
        binds = {
            whichKey.enable = true;
            cheatsheet.enable = false;
        };
        telescope.enable = true;
        git = {
            enable = true;
            gitsigns.enable = true;
            gitsigns.codeActions.enable = false;
        };
        notify.nvim-notify.enable = true;
        projects.project-nvim.enable = true;

        comments.comment-nvim.enable = true;
        extraPlugins = {
            vim-tmux-navigator.package = vim-tmux-navigator;
        };
    };
}
