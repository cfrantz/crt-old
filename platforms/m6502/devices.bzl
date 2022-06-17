load("//config:device.bzl", "device_config")

DEVICES = [
    device_config(
        name = "nintendo-nes",
        architecture = "m6502",
        feature_set = "//platforms/m6502/features:cc65",
        constraints = [
            "//antique/cpu:m6502",
            "@platforms//os:none",
        ],
        substitutions = {
        },
        #artifact_naming = [
        #    "//platforms/m6502/features:nesfile",
        #],
    ),
]
