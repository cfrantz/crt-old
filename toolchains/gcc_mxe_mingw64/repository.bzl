# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//config:repo.bzl", "compiler_repository")

def gcc_mxe_mingw64_repos():
    compiler_repository(
        name = "gcc_mxe_mingw64_files",
        url = "https://github.com/lowRISC/crt/releases/download/v0.3.9/mxe-binaries-win64.tar.xz",
        sha256 = "476a9e3f1efbcc9a432c343ec5bf5c3b176dfa406d5c9800d67e80b019ce5e31",
        strip_prefix = "mxe",
    )
