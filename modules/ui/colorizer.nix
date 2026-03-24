{
    flake.modules.ui.colorizer = {
        plugins.colorizer = {
            enable = true;
            settings = {
                user_default_options.names = false;
                fileTypes = [
                    "*"
                    {
                        language = "css";
                        names = true;
                    }
                ];
            };
        };
    };
}
