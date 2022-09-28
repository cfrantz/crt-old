# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//config:repo.bzl", "compiler_repository")

def gcc_mxe_mingw64_repos():
    compiler_repository(
        name = "gcc_mxe_mingw64_files",
        url = "https://github.com/lowRISC/crt/releases/download/v0.3.5/mxe-binaries.tar.xz",
        sha256 = "0ebe06d217a6596bac46186adf9e0d78a2d047ea81913556b92b688b247bd850",
        strip_prefix = "mxe",
    )
