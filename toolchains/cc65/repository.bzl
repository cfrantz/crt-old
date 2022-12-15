# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//config:repo.bzl", "compiler_repository")

def cc65_repos():
    compiler_repository(
        name = "cc65_files",
        url = "https://github.com/lowRISC/crt/releases/download/v0.3.7/cc65-binaries.tar.xz",
        sha256 = "26a9a4303edee579a44192e2272a923fe5096d9ddf499a97fac2cd92cf8bd418",
        strip_prefix = "cc65",
    )
