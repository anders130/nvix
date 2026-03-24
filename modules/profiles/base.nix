{config, ...}: {
    flake.modules.profiles.base = {
        imports = with config.flake.modules; [
            nixvim.default

            ui.colorscheme
            ui.dashboard
            ui.highlight
            ui.neo-tree
            ui.noice
            ui.statusline
        ];
    };
}
