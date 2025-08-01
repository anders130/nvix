{lib, ...}: let
    inherit (lib.nixvim) mkRaw;
in {
    plugins.noice.enable = true;
    plugins.lualine.settings.sections.lualine_x = [
        "mode"
        {
            color.fg = "#f5a97f";
            cond = mkRaw ''
                function()
                    local ok, noice = pcall(require, "noice")
                    if not ok then
                        return false
                    end
                    return noice.api.status.mode.has()
                end
            '';
            __unkeyed = mkRaw
            # lua
            ''
                function()
                    local ok, noice = pcall(require, "noice")
                    if not ok then
                        return false
                    end
                    return noice.api.status.mode.get()
                end
            '';
        }
    ];
}
