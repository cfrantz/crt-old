load("//features:defs.bzl", "FeatureSetInfo", "feature_set_subst")
load(
    "@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl",
    "tool_path",
)

PARAM_DEFAULTS = {
            "host_system_name": "x86_64-unknown-linux-gnu",
            "target_system_name": "unknown",
            "target_libc": "unknown",
            "compiler": "unknown",
            "abi_version": "unknown",
            "abi_libc_version": "unknown",
}

def isystemize(paths=[]):
    paths = ["-isystem"+p for p in paths]
    return "|".join(paths)

def _toolchain_config_impl(ctx):
    tool_paths = [
        tool_path(name=k, path=v)
        for k, v in ctx.attr.tools.items()
    ]
    params = dict(**PARAM_DEFAULTS)
    params.update(ctx.attr.params)
    features = feature_set_subst(ctx.attr.feature_set[FeatureSetInfo], **ctx.attr.substitutions)
    return cc_common.create_cc_toolchain_config_info(
        ctx = ctx,
        toolchain_identifier = ctx.attr.toolchain_identifier,
        target_cpu = ctx.attr.architecture,
        cxx_builtin_include_directories = ctx.attr.include_directories,
        host_system_name = params["host_system_name"],
        target_system_name = params["target_system_name"],
        target_libc = params["target_libc"],
        compiler = params["compiler"],
        abi_version = params["abi_version"],
        abi_libc_version = params["abi_libc_version"],
        tool_paths = tool_paths,
        features = features.values(),
    )


toolchain_config = rule(
    implementation = _toolchain_config_impl,
    attrs = {
        "architecture": attr.string(doc="Target architecture"),
        "feature_set": attr.label(providers=[FeatureSetInfo], doc="Features of this toolchain"),
        "substitutions": attr.string_dict(doc="Substitutions for the feature_set"),
        "tools": attr.string_dict(doc="Mapping of tool names to their wrapper paths"),
        "toolchain_identifier": attr.string(
            mandatory=True,
            doc="Indentifier used by the toolchain, this should be consistent with the cc_toolchain rule attribute",
        ),
        "include_directories": attr.string_list(doc="Compiler-specific include directories"),
        "params": attr.string_dict(doc="Toolchain config parameters", default={}),
    },
#    provides = [CcToolchainConfigInfo],
)
