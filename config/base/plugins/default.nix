{lib, ...}: {
    imports = lib.importFromDir ./.;

    plugins = {
        # essentials
        comment.enable = true; # "gc" to comment visual regions/lines
        indent-blankline.enable = true;
        otter.enable = true; # completion for embedded code
        vim-surround.enable = true;
        tmux-navigator.enable = true;
        which-key.enable = true;

        # git
        fugitive.enable = true; # git commands in nvim with ":G"
        # vim-rhubarb.enable = true;

        # autopairs
        ts-autotag.enable = true;
        nvim-autopairs.enable = true;

        # mini
        mini = {
            enable = true;
            modules = {
                ai.n_lines = 500;
                surround.enable = true;
            };
        };

        # misc
        web-devicons.enable = true;
        noice.enable = true;
    };
}
