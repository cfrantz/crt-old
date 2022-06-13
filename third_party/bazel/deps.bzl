load("@rules_foreign_cc//foreign_cc:repositories.bzl", "rules_foreign_cc_dependencies")
load("@rules_pkg//:deps.bzl", "rules_pkg_dependencies")

def bazel_deps():
    rules_foreign_cc_dependencies()
    rules_pkg_dependencies()
