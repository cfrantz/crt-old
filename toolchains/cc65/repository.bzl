# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//config:repo.bzl", "compiler_repository")

def cc65_repos():
    compiler_repository(
        name = "cc65_files",
        url = "https://github.com/cfrantz/crt/releases/download/v0.1.9-cc65/cc65-binaries.tar.xz",
        sha256 = "af83f4cf449042e35f500f708b51768b3b740978e9769746e7a796d90117cfdf",
        strip_prefix = "cc65",
    )
