load("//config:device.bzl", "device_config")
load("//config:compiler.bzl", "listify_flags")

DEVICES = [
    device_config(
        name = "nintendo-nes",
        architecture = "m6502",
        feature_set = "//platforms/m6502/features:cc65",
        constraints = [
            "//antique/cpu:m6502",
            "//antique/product:nes",
            "@platforms//os:none",
        ],
        substitutions = {
            "[TARGET]": listify_flags("--target|{}", ["nes"]),
        },
        #artifact_naming = [
        #    "//platforms/m6502/features:nesfile",
        #],
    ),
]
