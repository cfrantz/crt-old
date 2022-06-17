load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def cc65_src_repos():
    http_archive(
        name = "cc65_src",
        urls = [
            "https://github.com/cc65/cc65/archive/master.zip",
        ],
        build_file = Label("//third_party/cc65:BUILD.cc65_src.bazel"),
        strip_prefix = "cc65-master",
    )
