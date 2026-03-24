{
    flake.modules.nixvim.default = {
        performance.byteCompileLua = {
            enable = true;
            nvimRuntime = true;
        };
    };
}
