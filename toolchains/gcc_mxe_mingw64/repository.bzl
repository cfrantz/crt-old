# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//config:repo.bzl", "compiler_repository")

def gcc_mxe_mingw64_repos():
    compiler_repository(
        name = "gcc_mxe_mingw64_files",
        url = "https://github.com/cfrantz/crt/releases/download/v0.1.8/mxe-binaries.tar.xz",
        sha256 = "21a03dc553789e394c47224cc5c3998ee96d4c30a7c5896e375dcb0d77b987af",
        strip_prefix = "mxe",
    )
