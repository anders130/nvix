{
    flake.modules.lang.lilypond = {pkgs, ...}: {
        extraPackages = [pkgs.python3Packages.python-ly];
        plugins = {
            lilypond-suite.enable = true;
            conform-nvim = {
                enable = true;
                settings = {
                    formatters_by_ft.lilypond = ["ly"];
                    formatters.ly = {
                        command = "ly";
                        args = ["reformat"];
                        stdin = true;
                    };
                };
            };
            web-devicons.customIcons = rec {
                ly = {
                    icon = "󰴈";
                    color = "#97CE86";
                    name = "lilypond";
                };
                ily = ly;
            };
        };
    };
}
