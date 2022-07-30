# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//config:repo.bzl", "compiler_repository")

def cc65_repos():
    compiler_repository(
        name = "cc65_files",
        url = "https://github.com/lowRISC/crt/releases/download/v0.3.0/cc65-binaries.tar.xz",
        sha256 = "f8c016f245609bbf708acfa5375232496afb49478cc86ebca31c1732392d6466",
        strip_prefix = "cc65",
    )
