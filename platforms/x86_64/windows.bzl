# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("//config:device.bzl", "device_config")

DEVICES = [
    device_config(
        name = "pc-win64",
        architecture = "x86_64",
        feature_set = "//features/windows",
        constraints = [
            "@platforms//cpu:x86_64",
            "@platforms//os:windows",
        ],
        artifact_naming = [
            "//features/windows:exe",
            "//features/windows:dll",
        ],
    ),
]
