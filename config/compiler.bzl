load("//features:defs.bzl", "FeatureSetInfo")
load(
    "@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl",
    "tool_path",
)


def _toolchain_config_impl(ctx):
    pass


toolchain_config = rule(
    impl = _toolchain_config_impl,
    attrs = {
        "architecture": attr.string(doc="Target architecture",
        "feature_set": attr.label(providers=[FeatureSetInfo], doc="Features of this toolchain"),
        "substitutions": attr.string_dict(doc="Substitutions for the feature_set"),
        "tools": attr.label_keyed_string_dict(allow_files=True, doc="Mapping of tool labels to their tool name"),
    },
    provides = [CcToolchainConfigInfo],
)
