{
    flake.modules.lang.terraform = {
        plugins.lsp.servers.terraformls = {
            enable = true;
            filetypes = [
                "tf"
                "terraform"
                "terraform-vars"
                "tfvars"
                "tofu"
            ];
        };
    };
}
