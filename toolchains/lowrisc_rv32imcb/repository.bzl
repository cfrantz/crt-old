load("@crt//config:repo.bzl", "compiler_repository")

def lowrisc_rv32imcb_repos():
    compiler_repository(
        name = "lowrisc_rv32imcb_files",
        url = "https://github.com/lowRISC/lowrisc-toolchains/releases/download/20220524-1/lowrisc-toolchain-rv32imcb-20220524-1.tar.xz",
        strip_prefix = "lowrisc-toolchain-rv32imcb-20220524-1",
    )
