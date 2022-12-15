# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//config:repo.bzl", "compiler_repository")

def gcc_mxe_mingw32_repos():
    compiler_repository(
        name = "gcc_mxe_mingw32_files",
        url = "https://github.com/lowRISC/crt/releases/download/v0.3.7/mxe-binaries-win32.tar.xz",
        sha256 = "8d797cf72753eaaa711234e2117ead6500968ed03e95557c0aebc0e922b01da8",
        strip_prefix = "mxe",
    )
