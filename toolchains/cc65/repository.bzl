# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//config:repo.bzl", "compiler_repository")

def cc65_repos():
    compiler_repository(
        name = "cc65_files",
        url = "https://github.com/lowRISC/crt/releases/download/v0.3.3/cc65-binaries.tar.xz",
        sha256 = "e39989e688f42ef10568b593d2a2271b29021e19bc970c6471304ca0fcd6d0f3",
        strip_prefix = "cc65",
    )
