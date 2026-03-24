{
    # flake.modules.lang.kotlin_lsp = {
    #     stdenv,
    #     lib,
    #     fetchzip,
    #     makeWrapper,
    #     unzip,
    #     jdk21_headless,
    # }:
    #     stdenv.mkDerivation rec {
    #         pname = "kotlin-lsp";
    #         version = "262.2310.0";
    #
    #         src = fetchzip {
    #             url = "https://download-cdn.jetbrains.com/kotlin-lsp/${version}/kotlin-lsp-${version}-linux-x64.zip";
    #             hash = "sha256-Bf2qkFpNhQC/Mz563OapmCXeKN+dTrYyQbOcF6z6b48=";
    #             stripRoot = false;
    #         };
    #
    #         nativeBuildInputs = [
    #             makeWrapper
    #             unzip
    #         ];
    #
    #         installPhase = ''
    #             runHook preInstall
    #
    #             mkdir -p "$out"/bin "$out"/libexec/kotlin-lsp
    #             cp -r "$src"/lib "$src"/native "$src"/kotlin-lsp.sh "$out"/libexec/kotlin-lsp/
    #
    #             sed -i '/if \[ -d "$LOCAL_JRE_PATH" \]/,/fi/c\JAVA_BIN="java"' "$out"/libexec/kotlin-lsp/kotlin-lsp.sh
    #             sed -i '/chmod +x/d' "$out/libexec/kotlin-lsp/kotlin-lsp.sh"
    #
    #             chmod +x "$out"/libexec/kotlin-lsp/kotlin-lsp.sh
    #             makeWrapper "$out"/libexec/kotlin-lsp/kotlin-lsp.sh "$out"/bin/kotlin-lsp \
    #               --prefix PATH : "${jdk21_headless}/bin"
    #
    #             runHook postInstall
    #         '';
    #
    #         meta = {
    #             description = "Kotlin Language Server (Standalone Binary)";
    #             homepage = "https://github.com/Kotlin/kotlin-lsp";
    #             license = lib.licenses.asl20;
    #             platforms = lib.platforms.linux ++ lib.platforms.darwin;
    #         };
    #     };
}
