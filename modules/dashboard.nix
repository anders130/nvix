{
    vim = {
        dashboard.dashboard-nvim = {
            enable = true;
            setupOpts = {
                config = {
                    header = [
                        "███╗   ██╗██╗   ██╗██╗██╗  ██╗"
                        "████╗  ██║██║   ██║██║╚██╗██╔╝"
                        "██╔██╗ ██║██║   ██║██║ ╚███╔╝ "
                        "██║╚██╗██║╚██╗ ██╔╝██║ ██╔██╗ "
                        "██║ ╚████║ ╚████╔╝ ██║██╔╝ ██╗"
                        "╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝  ╚═╝"
                    ];
                    packages.enable = false;
                };
                theme = "hyper";
            };
        };
        visuals.indent-blankline.setupOpts.exclude.filetypes = ["dashboard"];
    };
}
