# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//config:repo.bzl", "compiler_repository")

def cc65_repos():
    compiler_repository(
        name = "cc65_files",
        url = "https://github.com/cfrantz/crt/releases/download/v0.2.0/cc65-binaries.tar.xz",
        sha256 = "7781def9866f07cc654186d77699a5ac674f51b377e06131a5ca340fe1d7a61d",
        strip_prefix = "cc65",
    )
