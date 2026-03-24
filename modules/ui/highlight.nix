{
    flake.modules.ui.highlight = {pkgs, ...}: {
        # Set highlight on search, but clear on pressing <Esc> in normal mode
        opts.hlsearch = true;

        # highlight yank
        autoCmd = [
            {
                desc = "Highlight when yanking text";
                event = ["TextYankPost"];
                callback.__raw = ''
                    function()
                        vim.highlight.on_yank()
                    end
                '';
            }
        ];

        # highlight undo
        extraPlugins = [pkgs.vimPlugins.highlight-undo-nvim];
        extraConfigLuaPre = ''
            require("highlight-undo").setup {}
        '';
    };
}
