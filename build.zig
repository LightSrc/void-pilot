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

    // Making directories
    const mkdir_scripts = b.addSystemCommand(&[_][]const u8{
        "mkdir", "-p", "zig-out/bin/scripts",
    });
    exe.step.dependOn(&mkdir_scripts.step);
    const mkdir_scripts_apps = b.addSystemCommand(&[_][]const u8{
        "mkdir", "-p", "zig-out/bin/scripts/apps",
    });
    exe.step.dependOn(&mkdir_scripts_apps.step);

    // Copying scripts
    const copy_update = b.addSystemCommand(&[_][]const u8{
        "cp", "src/scripts/update.sh", "zig-out/bin/scripts/update.sh",
    });
    exe.step.dependOn(&copy_update.step);
    const copy_firefox_xbps = b.addSystemCommand(&[_][]const u8{
        "cp", "src/scripts/apps/firefox_xbps.sh", "zig-out/bin/scripts/apps/firefox_xbps.sh",
    });
    exe.step.dependOn(&copy_firefox_xbps.step);
    const copy_firefox_flatpak = b.addSystemCommand(&[_][]const u8{
        "cp", "src/scripts/apps/firefox_flatpak.sh", "zig-out/bin/scripts/apps/firefox_flatpak.sh",
    });
    exe.step.dependOn(&copy_firefox_flatpak.step);

    b.installArtifact(exe);
    const run_cmd = b.addRunArtifact(exe);

    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);
}
