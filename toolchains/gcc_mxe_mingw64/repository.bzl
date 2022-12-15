# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//config:repo.bzl", "compiler_repository")

def gcc_mxe_mingw64_repos():
    compiler_repository(
        name = "gcc_mxe_mingw64_files",
        url = "https://github.com/lowRISC/crt/releases/download/v0.3.7/mxe-binaries-win64.tar.xz",
        sha256 = "ea991bdc47d2bca77d3bf8cc2e5779b41e1c836566d158f982771d72afe569e1",
        strip_prefix = "mxe",
    )
