# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//config:repo.bzl", "compiler_repository")

def gcc_mxe_mingw32_repos():
    compiler_repository(
        name = "gcc_mxe_mingw32_files",
        url = "https://github.com/lowRISC/crt/releases/download/v0.3.8/mxe-binaries-win32.tar.xz",
        sha256 = "aa66ff436932b325a7fa67562ea082b6d1fc5912672704df8c4dcf54f9ab2106",
        strip_prefix = "mxe",
    )
