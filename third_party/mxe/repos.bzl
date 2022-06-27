load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")

def mxe_src_repos():
    new_git_repository(
        name = "mxe_src",
        remote = "https://github.com/mxe/mxe",
        commit = "480e3a236fd3244b63af20633502b57586c3125e",
        build_file = Label("//third_party/mxe:BUILD.mxe_src.bazel"),
        patches = [
            Label("//third_party/mxe:gcc-cmdline-length.patch"),
        ],
        patch_args = ["-p1"],
    )
