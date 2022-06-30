# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//config:repo.bzl", "compiler_repository")

def gcc_mxe_mingw64_repos():
    compiler_repository(
        name = "gcc_mxe_mingw64_files",
        url = "https://github.com/cfrantz/crt/releases/download/v0.1.9-cc65/mxe-binaries.tar.xz",
        sha256 = "37e990d99366f2fafd65411535c422066aaed3c0dcd5e2ac06446f500dfb2dc8",
        strip_prefix = "mxe",
    )
