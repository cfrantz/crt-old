#!/bin/bash --norc
# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

PROG=${0##*/}
DRIVER_DIR=${0%/*}
TOOLCHAIN="cc65_files"

ARGS=()
POSTARGS=()
case "${PROG}" in
    ar)
        PROG=ar65
        ;;
    cpp)
        PROG=cl65
        ;;
    gcc)
        PROG=cl65
        ;;
    ld)
        PROG=ld65
        ;;
    objdump)
        PROG=od65
        ;;
    *)
        echo "No equivalent program for $PROG" &>2
        exit 1
esac

exec "external/${TOOLCHAIN}/bin/${PROG}" \
    "${ARGS[@]}" \
    "$@"\
    "${POSTARGS[@]}"
