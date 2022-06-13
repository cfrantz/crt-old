def _platform_transition_impl(settings, attr):
    return {"//command_line_option:platforms": attr.platform}

platform_transition = transition(
    implementation = _platform_transition_impl,
    inputs = [],
    outputs = ["//command_line_option:platforms"],
)

def platform_rule(**kwargs):
    "A wrapper over rule() for creating new rules that trigger the platform transition."

    attrs = kwargs.pop("attrs", {})
    if "platform" not in attrs:
        attrs["platform"] = attr.string(doc="Platform configuration")
    attrs["_allowlist_function_transition"] = attr.label(
        default = "@bazel_tools//tools/allowlists/function_transition_allowlist",
    )

    return rule(
        cfg = platform_transition,
        attrs = attrs,
        **kwargs
    )


def _target_platform_impl(ctx):
    info = ctx.attr.target[0][DefaultInfo]
    return [
        DefaultInfo(
            files = info.files,
            data_runfiles = info.data_runfiles,
        ),
    ]

target_platform = platform_rule(
    implementation = _target_platform_impl,
    attrs = {
        "target": attr.label(cfg = platform_transition),
    },
)
