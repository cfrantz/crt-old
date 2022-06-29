# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

def device_config(
        name,
        architecture,
        constraints,
        feature_set = "//features/common",
        artifact_naming = [],
        substitutions = {}):
    return struct(
        name = name,
        architecture = architecture,
        constraints = constraints,
        feature_set = feature_set,
        artifact_naming = artifact_naming,
        substitutions = substitutions,
    )
