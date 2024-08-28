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
    const mkdir_scripts_flatpak = b.addSystemCommand(&[_][]const u8{
        "mkdir", "-p", "zig-out/bin/scripts/flatpak",
    });
    exe.step.dependOn(&mkdir_scripts_flatpak.step);
    const mkdir_scripts_apps = b.addSystemCommand(&[_][]const u8{
        "mkdir", "-p", "zig-out/bin/scripts/apps",
    });
    exe.step.dependOn(&mkdir_scripts_apps.step);
    const mkdir_scripts_apps_browsers = b.addSystemCommand(&[_][]const u8{
        "mkdir", "-p", "zig-out/bin/scripts/apps/browsers",
    });
    exe.step.dependOn(&mkdir_scripts_apps_browsers.step);

    // Copying scripts
    const copy_update = b.addSystemCommand(&[_][]const u8{
        "cp", "src/scripts/update.sh", "zig-out/bin/scripts/update.sh",
    });
    exe.step.dependOn(&copy_update.step);
    const copy_flatpak = b.addSystemCommand(&[_][]const u8{
        "cp", "src/scripts/flatpak/flatpak.sh", "zig-out/bin/scripts/flatpak/flatpak.sh",
    });
    exe.step.dependOn(&copy_flatpak.step);
    const copy_brave_xbps = b.addSystemCommand(&[_][]const u8{
        "cp", "src/scripts/apps/browsers/brave_xbps.sh", "zig-out/bin/scripts/apps/browsers/brave_xbps.sh",
    });
    exe.step.dependOn(&copy_brave_xbps.step);
    const copy_brave_flatpak = b.addSystemCommand(&[_][]const u8{
        "cp", "src/scripts/apps/browsers/brave_flatpak.sh", "zig-out/bin/scripts/apps/browsers/brave_flatpak.sh",
    });
    exe.step.dependOn(&copy_brave_flatpak.step);
    const copy_chromium_xbps = b.addSystemCommand(&[_][]const u8{
        "cp", "src/scripts/apps/browsers/chromium_xbps.sh", "zig-out/bin/scripts/apps/browsers/chromium_xbps.sh",
    });
    exe.step.dependOn(&copy_chromium_xbps.step);
    const copy_chromium_flatpak = b.addSystemCommand(&[_][]const u8{
        "cp", "src/scripts/apps/browsers/chromium_flatpak.sh", "zig-out/bin/scripts/apps/browsers/chromium_flatpak.sh",
    });
    exe.step.dependOn(&copy_chromium_flatpak.step);
    const copy_firefox_xbps = b.addSystemCommand(&[_][]const u8{
        "cp", "src/scripts/apps/browsers/firefox_xbps.sh", "zig-out/bin/scripts/apps/browsers/firefox_xbps.sh",
    });
    exe.step.dependOn(&copy_firefox_xbps.step);
    const copy_firefox_flatpak = b.addSystemCommand(&[_][]const u8{
        "cp", "src/scripts/apps/browsers/firefox_flatpak.sh", "zig-out/bin/scripts/apps/browsers/firefox_flatpak.sh",
    });
    exe.step.dependOn(&copy_firefox_flatpak.step);
    const copy_floorp_xbps = b.addSystemCommand(&[_][]const u8{
        "cp", "src/scripts/apps/browsers/floorp_xbps.sh", "zig-out/bin/scripts/apps/browsers/floorp_xbps.sh",
    });
    exe.step.dependOn(&copy_floorp_xbps.step);
    const copy_floorp_flatpak = b.addSystemCommand(&[_][]const u8{
        "cp", "src/scripts/apps/browsers/floorp_flatpak.sh", "zig-out/bin/scripts/apps/browsers/floorp_flatpak.sh",
    });
    exe.step.dependOn(&copy_floorp_flatpak.step);
    const copy_librewolf_xbps = b.addSystemCommand(&[_][]const u8{
        "cp", "src/scripts/apps/browsers/librewolf_xbps.sh", "zig-out/bin/scripts/apps/browsers/librewolf_xbps.sh",
    });
    exe.step.dependOn(&copy_librewolf_xbps.step);
    const copy_librewolf_flatpak = b.addSystemCommand(&[_][]const u8{
        "cp", "src/scripts/apps/browsers/librewolf_flatpak.sh", "zig-out/bin/scripts/apps/browsers/librewolf_flatpak.sh",
    });
    exe.step.dependOn(&copy_librewolf_flatpak.step);
    const copy_opera_xbps = b.addSystemCommand(&[_][]const u8{
        "cp", "src/scripts/apps/browsers/opera_xbps.sh", "zig-out/bin/scripts/apps/browsers/opera_xbps.sh",
    });
    exe.step.dependOn(&copy_opera_xbps.step);
    const copy_opera_flatpak = b.addSystemCommand(&[_][]const u8{
        "cp", "src/scripts/apps/browsers/opera_flatpak.sh", "zig-out/bin/scripts/apps/browsers/opera_flatpak.sh",
    });
    exe.step.dependOn(&copy_opera_flatpak.step);
    const copy_thorium_xbps = b.addSystemCommand(&[_][]const u8{
        "cp", "src/scripts/apps/browsers/thorium_xbps.sh", "zig-out/bin/scripts/apps/browsers/thorium_xbps.sh",
    });
    exe.step.dependOn(&copy_thorium_xbps.step);
    const copy_ungoogled_chromium_xbps = b.addSystemCommand(&[_][]const u8{
        "cp", "src/scripts/apps/browsers/ungoogled_chromium_xbps.sh", "zig-out/bin/scripts/apps/browsers/ungoogled_chromium_xbps.sh",
    });
    exe.step.dependOn(&copy_ungoogled_chromium_xbps.step);
    const copy_ungoogled_chromium_flatpak = b.addSystemCommand(&[_][]const u8{
        "cp", "src/scripts/apps/browsers/ungoogled_chromium_flatpak.sh", "zig-out/bin/scripts/apps/browsers/ungoogled_chromium_flatpak.sh",
    });
    exe.step.dependOn(&copy_ungoogled_chromium_flatpak.step);
    const copy_vivaldi_xbps = b.addSystemCommand(&[_][]const u8{
        "cp", "src/scripts/apps/browsers/vivaldi_xbps.sh", "zig-out/bin/scripts/apps/browsers/vivaldi_xbps.sh",
    });
    exe.step.dependOn(&copy_vivaldi_xbps.step);
    const copy_vivaldi_flatpak = b.addSystemCommand(&[_][]const u8{
        "cp", "src/scripts/apps/browsers/vivaldi_flatpak.sh", "zig-out/bin/scripts/apps/browsers/vivaldi_flatpak.sh",
    });
    exe.step.dependOn(&copy_vivaldi_flatpak.step);
    const copy_zen_flatpak = b.addSystemCommand(&[_][]const u8{
        "cp", "src/scripts/apps/browsers/zen_flatpak.sh", "zig-out/bin/scripts/apps/browsers/zen_flatpak.sh",
    });
    exe.step.dependOn(&copy_zen_flatpak.step);

    b.installArtifact(exe);
    const run_cmd = b.addRunArtifact(exe);

    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);
}
