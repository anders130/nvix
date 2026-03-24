{
    flake.modules.ui.neo-tree = {pkgs, ...}: {
        plugins.neo-tree = {
            enable = true;
            package = pkgs.vimPlugins.neo-tree-nvim.overrideAttrs (old: {
                src = pkgs.fetchFromGitHub {
                    owner = "nvim-neo-tree";
                    repo = "neo-tree.nvim";
                    rev = "b0b73273b4f5a1f4b4aac8accd6e0c3b4b5a6967";
                    sha256 = "sha256-PRhip7vEFDLh5zei3s/bS0AysbtT9iE7yYNFkIEqct8=";
                };
            });
            settings = {
                usePopupsForInput = false;
                buffers.followCurrentFile = {
                    enabled = true;
                    leaveDirsOpen = false;
                };
                window = {
                    position = "right";
                    mappings."<space>" = "none";
                };
                filesystem = {
                    use_libuv_file_watcher = true;
                    hijack_netrw_behavior = "open_default";
                    group_empty_dirs = true;
                };
            };
        };

        keymaps = [
            {
                mode = "n";
                key = "<leader>e";
                action.__raw = ''
                    function()
                        require("neo-tree.command").execute({
                            toggle = true,
                            reveal = true,
                        })
                    end
                '';
            }
        ];
    };
}
