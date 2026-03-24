{
    flake.modules.nixvim.default = {
        plugins = {
            gitsigns = {
                enable = true;
                settings.current_line_blame = true;
            };
            fugitive.enable = true; # git commands in nvim with ":G"
        };
    };
}
