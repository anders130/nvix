{config, ...}: {
    flake.modules.profiles.full = {
        imports = with config.flake.modules; [
            profiles.base

            ai.supermaven

            extras.cellular-automaton
            extras.image

            lang.azure_pipelines
            lang.rust
            lang.qml
            lang.nix
            lang.typescript
            lang.docker
            lang.vhdl
            lang.kotlin
            lang.terraform
            lang.typst
            lang.csharp
            lang.lua
            lang.lilypond
            lang.python

            ui.colorizer
            ui.diagnostics
        ];

        plugins = {
            godot.enable = true;
            markdown-preview.enable = true;
        };
    };
}
