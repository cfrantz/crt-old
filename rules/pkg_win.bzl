# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("//rules:transition.bzl", "platform_rule")

def _pkg_win_impl(ctx):
    out = ctx.actions.declare_file(ctx.attr.name + ".zip")
    args = [
        "--mxe={}".format(ctx.files._mxe[0].dirname),
        "--out={}".format(out.path),
    ]
    if ctx.attr.skip_dlls:
        args.append("--skip_dlls={}".format(",".join([dll for dll in ctx.attr.skip_dlls])))
    if ctx.attr.zips:
        args.append("--combine_zips={}".format(",".join([z.path for z in ctx.files.zips])))
    args.extend([src.path for src in ctx.files.srcs])

    ctx.actions.run(
        executable = ctx.executable._tool,
        arguments = args,
        inputs = ctx.files.srcs + ctx.files._mxe + ctx.files.zips,
        outputs = [out],
        progress_message = "Packaging files into {}".format(out.basename),
        mnemonic = "PkgWin",
    )
    return DefaultInfo(
        files = depset([out]),
        runfiles = ctx.runfiles(files = [out]),
    )

pkg_win = platform_rule(
    implementation = _pkg_win_impl,
    attrs = {
        "srcs": attr.label_list(
            doc = "List of targets to include in this package",
            allow_files = True,
        ),
        "skip_dlls": attr.string_list(
            doc = "Names of DLLs that can be ignored in dependency analysis",
        ),
        "platform": attr.string(
            default = "@crt//platforms/x86_64:win64",
            doc = "The target platform",
        ),
        "zips": attr.label_list(
            doc = "List of additional ZIP archives to re-pack into this archive",
            allow_files = True,
        ),
        "_mxe": attr.label(
            doc = "Location of the MXE toolchain",
            default = "@gcc_mxe_mingw64_files//:all",
        ),
        "_tool": attr.label(
            default = "//util:pkg_win",
            cfg = "host",
            executable = True,
        ),
    },
)
