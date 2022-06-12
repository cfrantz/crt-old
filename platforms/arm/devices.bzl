load("//config:device.bzl", "device_config")

DEVICES = [
    device_config(
        name = "cortex_m",
        architecture = "armv6-m",
        constraints = [
            "@platforms//cpu:armv6-m",
        ],
    ),
]
