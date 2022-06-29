load("@crt//config:repo.bzl", "compiler_repository")

def gcc_mxe_mingw64_repos():
    compiler_repository(
        name = "gcc_mxe_mingw64_files",
        url = "https://github.com/cfrantz/crt/releases/download/v0.1.7/mxe-binaries.tar.xz",
        strip_prefix = "mxe",
    )
