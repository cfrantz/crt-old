# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//config:repo.bzl", "compiler_repository")

def gcc_mxe_mingw64_repos():
    compiler_repository(
        name = "gcc_mxe_mingw64_files",
        url = "https://github.com/cfrantz/crt/releases/download/v0.2.0/mxe-binaries.tar.xz",
        sha256 = "de48f57e64ae6c86da45fac614c5fdc37f5950b9f90ad24fbc20be7464caf1a9",
        strip_prefix = "mxe",
    )
