# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//config:repo.bzl", "compiler_repository")

def gcc_mxe_mingw64_repos():
    compiler_repository(
        name = "gcc_mxe_mingw64_files",
        url = "https://github.com/lowRISC/crt/releases/download/v0.3.4/mxe-binaries.tar.xz",
        sha256 = "6672d4e7f02e03c47db9c3725a8fb3d859adb867470c51e956f080db0dd3435a",
        strip_prefix = "mxe",
    )
