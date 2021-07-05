load("@io_bazel_rules_go//go:def.bzl", "go_context")
load("@bazel_skylib//lib:shell.bzl", "shell")

def _go_vendor(ctx):
    go = go_context(ctx)
    out = ctx.actions.declare_file(ctx.label.name + ".sh")
    substitutions = {
        "@@GO@@": shell.quote(go.go.path),
        "@@GAZELLE@@": shell.quote(ctx.executable._gazelle.short_path),
    }
    ctx.actions.expand_template(
        template = ctx.file._template,
        output = out,
        substitutions = substitutions,
        is_executable = True,
    )
    return [
        DefaultInfo(
            runfiles = ctx.runfiles(files = [go.go, ctx.executable._gazelle]),
            executable = out,
        ),
    ]
go_vendor = rule(
    implementation = _go_vendor,
    executable = True,
    attrs = {
        "_template": attr.label(
            default = "//build/rules/go:vendor.bash",
            allow_single_file = True,
        ),
        "_gazelle": attr.label(
            default = "@bazel_gazelle//cmd/gazelle",
            executable = True,
            cfg = "host",
        ),
    },
    toolchains = ["@io_bazel_rules_go//go:toolchain"],
)
