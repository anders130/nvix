{
    flake.modules.lang.azure_pipelines = {pkgs, ...}: let
        azure-pipelines-language-server = pkgs.buildNpmPackage rec {
            pname = "azure-pipelines-language-server";
            version = "0.8.0";
            src = pkgs.fetchFromGitHub {
                owner = "microsoft";
                repo = "azure-pipelines-language-server";
                rev = "azure-pipelines-language-server/v${version}";
                hash = "sha256-jAQ8fTwVqZL2qLdgwCl7TF3ExXDo2hVfqL7OnkVvSeY=";
            };
            sourceRoot = "${src.name}/language-server";
            npmDepsHash = "sha256-FH1eoqDfsUSDELgMbo2JB8AW+t6XXApHqZ9V2aKWI6o=";
            buildPhase = "npm run compile";
        };
    in {
        plugins.lsp.servers.azure_pipelines_ls = {
            enable = true;
            package = azure-pipelines-language-server;
            rootMarkers = [".azure-pipelines" "azure-pipelines.yml"];
            settings.yaml.schemas."https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json" = [
                "azure-pipelines.yml"
                ".azure-pipelines/**/*.yml"
                ".azure-pipelines/**/*.yaml"
            ];
        };
    };
}
