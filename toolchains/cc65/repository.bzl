# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//config:repo.bzl", "compiler_repository")

def cc65_repos():
    compiler_repository(
        name = "cc65_files",
        url = "https://github.com/lowRISC/crt/releases/download/v0.3.4/cc65-binaries.tar.xz",
        sha256 = "cf9b7dcdcdecb0c97cd824ab78ac1e3d29a1585053a2eaef77195afde2e7864f",
        strip_prefix = "cc65",
    )
