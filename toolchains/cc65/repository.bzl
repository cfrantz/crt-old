# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//config:repo.bzl", "compiler_repository")

def cc65_repos():
    compiler_repository(
        name = "cc65_files",
        url = "https://github.com/lowRISC/crt/releases/download/v0.3.5/cc65-binaries.tar.xz",
        sha256 = "179d07f2ee61cee0ddecf7f1bb605479cf501afa5c1286b7d7069782f7799389",
        strip_prefix = "cc65",
    )
