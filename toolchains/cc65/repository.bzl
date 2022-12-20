# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//config:repo.bzl", "compiler_repository")

def cc65_repos():
    compiler_repository(
        name = "cc65_files",
        url = "https://github.com/lowRISC/crt/releases/download/v0.3.8/cc65-binaries.tar.xz",
        sha256 = "8f73ce3f08d516272ec002c4acc1f7418efc010ed7c80563c8ff6a4c7cd3cb9c",
        strip_prefix = "cc65",
    )
