# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//config:repo.bzl", "compiler_repository")

def cc65_repos():
    compiler_repository(
        name = "cc65_files",
        url = "https://github.com/lowRISC/crt/releases/download/v0.3.6/cc65-binaries.tar.xz",
        sha256 = "cf666cf5452bf081b68ef9ae2722ce77da0969d075a3633c95b941be08dcd92a",
        strip_prefix = "cc65",
    )
