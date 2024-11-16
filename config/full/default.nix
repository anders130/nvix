{lib, ...}: {
    imports = lib.importFromDir ./.;

    plugins = {
        godot.enable = true;
        markdown-preview.enable = true;
    };
}
