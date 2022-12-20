# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//config:repo.bzl", "compiler_repository")

def gcc_mxe_mingw64_repos():
    compiler_repository(
        name = "gcc_mxe_mingw64_files",
        url = "https://github.com/lowRISC/crt/releases/download/v0.3.8/mxe-binaries-win64.tar.xz",
        sha256 = "0a54c9946f596a6203dc96940bdeb2b199bedc9786599eb6b6d47f07bd633ab7",
        strip_prefix = "mxe",
    )
