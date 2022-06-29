# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("//config:device.bzl", "device_config")

DEVICES = [
    device_config(
        name = "cortex_m",
        architecture = "armv6-m",
        feature_set = "//platforms/arm/features:arm",
        constraints = [
            "@platforms//cpu:armv6-m",
        ],
        substitutions = {
            "ARCHITECTURE": "armv6-m",
            "FPU": "auto",
            "FLOAT_ABI": "soft",
            "ENDIAN": "little",
            "[THUMB]": "-mthumb",
        },
    ),
]
