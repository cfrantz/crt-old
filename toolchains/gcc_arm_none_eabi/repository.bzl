# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//config:repo.bzl", "compiler_repository")

def gcc_arm_none_eabi_repos():
    compiler_repository(
        name = "gcc_arm_none_eabi_files",
        url = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2",
        strip_prefix = "gcc-arm-none-eabi-10.3-2021.10",
    )
