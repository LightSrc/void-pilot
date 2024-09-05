const std = @import("std");
const vaxis = @import("vaxis");
const memoryModule = @import("memory.zig");
const mainModule = @import("main.zig");
const menu = @import("panels/menu.zig");

var terminal_: ?vaxis.widgets.Terminal = null;
var terminal_exited: bool = false;
var script_path_: []const []const u8 = &[_][]const u8{};
var waiting_to_create: bool = false;

pub fn initialize(script_path: []const []const u8) !void {
    if (terminal_ != null) return;
    script_path_ = script_path;
    waiting_to_create = true;
}

pub fn create() !void {
    if (terminal_ != null) return;
    if (waiting_to_create == false) return;

    menu.menuTable.active = false;
    var env = try std.process.getEnvMap(memoryModule.alloc);
    defer env.deinit();

    var buf: [std.fs.MAX_PATH_BYTES]u8 = undefined;
    const cwd = try std.fs.selfExeDirPath(&buf);
    const vt_opts: vaxis.widgets.Terminal.Options = .{
        .winsize = .{
            .rows = 24,
            .cols = 100,
            .x_pixel = 0,
            .y_pixel = 0,
        },
        .scrollback_size = 0,
        .initial_working_directory = cwd,
    };
    terminal_ = try vaxis.widgets.Terminal.init(
        memoryModule.alloc,
        script_path_,
        &env,
        &mainModule.vx.unicode,
        vt_opts,
    );
    try terminal_.?.spawn();
    terminal_exited = false;
    waiting_to_create = false;
}

pub fn deinitialize() void {
    terminal_.?.deinit();
    terminal_ = null;
    menu.menuTable.active = true;
}

pub fn update(keys: anytype) !void {
    if (terminal_ == null) return;
    try terminal_.?.update(keys);
}

pub fn draw() !void {
    if (terminal_ == null) return;
    menu.menuWindow.window.hideCursor();
    menu.menuWindow.window.clear();
    const child = menu.menuWindow.window.child(.{
        .x_off = 4,
        .y_off = 2,
        .width = .{ .limit = menu.menuWindow.window.width - 8 },
        .height = .{ .limit = menu.menuWindow.window.width - 6 },
        .border = .{
            .where = .all,
        },
    });

    try terminal_.?.resize(.{
        .rows = child.height,
        .cols = child.width,
        .x_pixel = 0,
        .y_pixel = 0,
    });
    try terminal_.?.draw(child);
}

pub fn refresh() !void {
    while (terminal_ != null) {
        if (terminal_.?.tryEvent()) |event| {
            switch (event) {
                .bell => {},
                .title_change => {},
                .exited => exited(),
                .redraw => {},
                .pwd_change => {},
            }
        } else {
            break;
        }
    }
}

pub fn closeTerminal() void {
    if (terminal_ == null) return;
    if (terminal_exited == false) return;
    deinitialize();
}

pub fn tryCancelScript() void {
    if (terminal_ == null) return;
    if (terminal_exited == true) return;
    exited();
    deinitialize();
}

fn exited() void {
    terminal_exited = true;
}
