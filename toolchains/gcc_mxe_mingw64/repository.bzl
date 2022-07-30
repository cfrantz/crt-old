# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//config:repo.bzl", "compiler_repository")

def gcc_mxe_mingw64_repos():
    compiler_repository(
        name = "gcc_mxe_mingw64_files",
        url = "https://github.com/lowRISC/crt/releases/download/v0.3.0/mxe-binaries.tar.xz",
        sha256 = "d8d06cbe42fa0860fa1d379851ce0a1b16268fa26f32dcdba15cc68399fb0d12",
        strip_prefix = "mxe",
    )
