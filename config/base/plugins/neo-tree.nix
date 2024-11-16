{
    plugins.neo-tree = {
        enable = true;
        usePopupsForInput = false;
        buffers.followCurrentFile = {
            enabled = true;
            leaveDirsOpen = false;
        };
        window = {
            position = "right";
            mappings."<space>" = "none";
        };
    };

    keymaps = [
        {
            mode = "n";
            key = "<leader>e";
            action.__raw = ''function()
                require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
            end'';
        }
    ];
}
