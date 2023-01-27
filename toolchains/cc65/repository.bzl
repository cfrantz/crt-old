# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//config:repo.bzl", "compiler_repository")

def cc65_repos():
    compiler_repository(
        name = "cc65_files",
        url = "https://github.com/lowRISC/crt/releases/download/v0.3.9/cc65-binaries.tar.xz",
        sha256 = "7dd60a064ee261039749bb7294cd4ccee06118beaa3ea3f374d1bb6653cf0c21",
        strip_prefix = "cc65",
    )
