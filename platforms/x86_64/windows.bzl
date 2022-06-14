load("//config:device.bzl", "device_config")

DEVICES = [
    device_config(
        name = "pc-win64",
        architecture = "x86_64",
        feature_set = "//platforms/x86_64/features:windows",
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
