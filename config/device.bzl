def device_config(
        name,
        architecture,
        constraints,
        feature_set = "//features/common",
        artifact_naming = [],
        substitutions = {},
    ):
    return struct(
        name = name,
        architecture = architecture,
        constraints = constraints,
        feature_set = feature_set,
        artifact_naming = artifact_naming,
        substitutions = substitutions,
    )
