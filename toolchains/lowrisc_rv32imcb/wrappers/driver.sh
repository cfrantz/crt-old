#!/bin/bash --norc
# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

PROG=$(basename "$0")
DRIVER_DIR=$(dirname "$0")
TOOLCHAIN="lowrisc_rv32imcb_files"
PREFIX="riscv32-unknown-elf"

ARGS=()
POSTARGS=()
case "${PROG}" in
    gcc)
        ;;
esac

exec "external/${TOOLCHAIN}/bin/${PREFIX}-${PROG}" \
    "${ARGS[@]}" \
    "$@"\
    "${POSTARGS[@]}"
