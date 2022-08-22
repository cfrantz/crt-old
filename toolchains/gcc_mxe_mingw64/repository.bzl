# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//config:repo.bzl", "compiler_repository")

def gcc_mxe_mingw64_repos():
    compiler_repository(
        name = "gcc_mxe_mingw64_files",
        url = "https://github.com/lowRISC/crt/releases/download/v0.3.3/mxe-binaries.tar.xz",
        sha256 = "8784d936369f95305feb5486942d45af02279ce7e82a3a7aeedbcf39b0b6214a",
        strip_prefix = "mxe",
    )
