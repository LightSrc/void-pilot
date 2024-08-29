const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const vaxis_dep = b.dependency("vaxis", .{
        .target = target,
        .optimize = optimize,
    });

    const exe = b.addExecutable(.{
        .name = "void-pilot",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });
    exe.root_module.addImport("vaxis", vaxis_dep.module("vaxis"));

    // Making directories & Copying files
    const mkdir_scripts = b.addSystemCommand(&[_][]const u8{
        "sh",
        "-c",
        "mkdir -p zig-out/bin/scripts/flatpak/ zig-out/bin/scripts/apps/browsers/ && cp -r src/scripts/* zig-out/bin/scripts",
    });
    exe.step.dependOn(&mkdir_scripts.step);

    b.installArtifact(exe);
    const run_cmd = b.addRunArtifact(exe);

    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);
}
