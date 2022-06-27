def _release_impl(ctx):
    artifacts = []
    runfiles = []
    for k, v in ctx.attr.artifacts.items():
        files = k[DefaultInfo].files.to_list()
        if len(files) > 1:
            fail("Artifacts must produce a single file")
        runfiles.extend(files)
        artifacts.append("'{}#{}'".format(files[0].path, v))

    runner = ctx.actions.declare_file(ctx.label.name + ".bash")
    ctx.actions.expand_template(
        template = ctx.file._runner,
        output = runner,
        is_executable = True,
        substitutions = {
            "@@ARTIFACTS@@": " ".join(artifacts),
            "@@GH@@": ctx.executable._gh.path,
        },
    )

    return DefaultInfo(
        files = depset([runner]),
        runfiles = ctx.runfiles(files = [ctx.executable._gh] + runfiles),
        executable = runner,
    )

release = rule(
    implementation = _release_impl,
    attrs = {
        "artifacts": attr.label_keyed_string_dict(
            doc = "Mapping of release artifacts to their text descriptions",
            allow_files = True,
        ),
        "_gh": attr.label(
            default = "@com_github_gh//:gh",
            cfg = "exec",
            executable = True,
        ),
        "_runner": attr.label(
            default = "//third_party/github:release.template.bash",
            allow_single_file = True,
        ),
    },
    executable = True,
)
