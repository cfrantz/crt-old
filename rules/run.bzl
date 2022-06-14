load("//config:execution.bzl", "ExecConfigInfo")
load("//rules:transition.bzl", "platform_rule")

BATCH_TEMPLATE = """
{windows_binary} >_stdout.txt 2>_stderr.txt
echo %ERRORLEVEL% >_exit.txt
{shutdown}
"""

# FIXME: deal with ctx.attr.binary and exec_config.program better.
# Make sure throw errors if they're multiple files.
def _runner_impl(ctx):
    exec_config = ctx.attr.exec_config[ExecConfigInfo]
    subst = dict(exec_config.substitutions)
    subst.update(ctx.attr.substitutions)
    binary = ctx.attr.binary[DefaultInfo].files.to_list()[0]
    subst["binary"] = binary.short_path
    subst["windows_binary"] = binary.short_path.replace("/", "\\")
    params = []
    exclude_external = "false"
    for p in exec_config.params:
        if 'exclude_external' in p:
            exclude_external = "true"
        params.append(p.format(**subst))

    out_file = ctx.actions.declare_file(ctx.label.name + ".bash")
    program = exec_config.program[DefaultInfo].files.to_list()[0]
    ctx.actions.expand_template(
        template = ctx.file._runner,
        output = out_file,
        substitutions = {
            "@EXCLUDE_EXTERNAL@": exclude_external,
            "@EMULATOR@": program.short_path,
            "@ARGS@": " ".join(params),
        },
        is_executable = True,
    )
    runfiles = [program, binary]
    if exec_config.preparation == "windows":
        batch = ctx.actions.declare_file("__test__.bat")
        ctx.actions.write(batch, BATCH_TEMPLATE.format(**subst))
        runfiles.append(batch)

    runfiles = ctx.runfiles(files = runfiles + exec_config.data)
    runfiles = runfiles.merge(exec_config.program[DefaultInfo].data_runfiles)
    runfiles = runfiles.merge(ctx.attr.binary[DefaultInfo].data_runfiles)
    return DefaultInfo(
        files = depset([out_file]),
        runfiles = runfiles,
        executable = out_file,
    )

runner = platform_rule(
    implementation = _runner_impl,
    attrs = {
        "binary": attr.label(doc="Program to execute"),
        "exec_config": attr.label(mandatory=True, providers=[ExecConfigInfo], doc="Execution configuration"),
        "substitutions": attr.string_dict(doc="Substitutions to apply to the exec_config"),
        "_runner": attr.label(
            default = "//rules/scripts:runner.template.bash",
            allow_single_file = True,
        ),

    },
    executable = True,
)
