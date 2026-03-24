{
    flake.modules.nixvim.default = {
        plugins = {
            # essentials
            comment.enable = true; # "gc" to comment visual regions/lines
            indent-blankline.enable = true;
            otter.enable = true; # completion for embedded code
            tmux-navigator.enable = true;
            which-key.enable = true;
            direnv.enable = true;

            # autopairs
            ts-autotag.enable = true;
            nvim-autopairs.enable = true;

            # mini
            mini = {
                enable = true;
                modules = {
                    ai.n_lines = 500;
                    surround = {};
                };
            };

            # misc
            web-devicons.enable = true;
            snacks = {
                enable = true;
                settings = {
                    notifier = {
                        enable = true;
                        top_down = false;
                        timeout = 2000;
                    };
                    quickfile.enable = true;
                    rename.enable = true;
                };
            };
        };
    };
}
