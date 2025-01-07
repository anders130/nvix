let
    inherit (builtins) attrNames filter concatStringsSep isList isString hasAttr isAttrs;
    toNixString = value:
        if isAttrs value then
            let
                hasType = hasAttr "type" value;
                typeString = if hasType then ''"${value.type}"'' else "";
                otherAttrs = attrNames value
                    |> filter (key: key != "type")
                    |> map (key: ''${key} = ${toNixString value.${key}}'')
                    |> concatStringsSep ", ";
            in
                if hasType && otherAttrs != "" then "{ ${typeString}, ${otherAttrs} }"
                else
                    if hasType then "{ ${typeString} }"
                    else "{ ${otherAttrs} }"
                else
                    if isList value then value
                        |> map toNixString
                        |> concatStringsSep ", "
                        |> (listString: "[ ${listString} ]")
                    else if isString value then ''"${value}"''
                    else toString value;

    convert = items: map (i: toNixString i) items;
in {
    vim.statusline.lualine = let
        separator = {
            left = "";
            right = "";
        };
    in {
        enable = true;
        theme = "catppuccin";
        activeSection = {
            a = convert [
                {
                    type = "mode";
                    icons_enabled = true;
                    separator = {
                        inherit (separator) right;
                    };
                }
                {
                    draw_empty = true;
                    inherit separator;
                }
            ];
            b = convert [
                {
                    type = "filetype";
                    colored = true;
                    icon_only = true;
                    icon.align = "left";
                }
                {
                    type = "filename";
                    symbols = {
                        modified = " ";
                        readonly = " ";
                    };
                    separator = {
                        inherit (separator) right;
                    };
                }
            ];
            y = convert [
                {
                    type = "";
                    draw_empty = true;
                    inherit separator;
                }
                {
                    type = "searchcount";
                    maxcount = 999;
                    timeout = 120;
                    separator = {
                        inherit (separator) left;
                    };
                }
                {
                    type = "branch";
                    icon = " •";
                    separator = {
                        inherit (separator) left;
                    };
                }
            ];
            z = convert [
                {
                    type = "";
                    inherit separator;
                }
                {
                    type = "progress";
                    separator = {
                        inherit (separator) left;
                    };
                }
                {
                    type = "location";
                }
                {
                    type = "fileformat";
                    color.fg = "black";
                    symbols = {
                        unix = "";
                        dos = "";
                        mac = "";
                    };
                }
            ];
        };
    };
}
