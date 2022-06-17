load("@crt//config:repo.bzl", "compiler_repository")

def cc65_repos():
    compiler_repository(
        name = "cc65_files",
        #url = "https://github.com/cfrantz/mxe/releases/download/crt-2022-06-12_1/mxe-crt-2022-06-12_1.tar.xz",
        # Local dev/debug:
        archive = Label("//prebuilt:cc65-binaries.tar.xz"),
        strip_prefix = "cc65",
    )
