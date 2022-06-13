load("//third_party/bazel:repos.bzl", "bazel_repos")
load("//third_party/qemu:repos.bzl", "qemu_binary_repos")

def crt_repos():
    bazel_repos()
    qemu_binary_repos()
