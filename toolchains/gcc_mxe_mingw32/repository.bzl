# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//config:repo.bzl", "compiler_repository")

def gcc_mxe_mingw32_repos():
    compiler_repository(
        name = "gcc_mxe_mingw32_files",
        url = "https://github.com/lowRISC/crt/releases/download/v0.3.9/mxe-binaries-win32.tar.xz",
        sha256 = "77e6d960979efe98ae5a74efe882a8281eddf77786b99f336095fbe0d10e6b57",
        strip_prefix = "mxe",
    )
