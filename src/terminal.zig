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
        .width = menu.menuWindow.window.width - 8,
        .height = menu.menuWindow.window.width - 6,
        .border = .{
            .where = .all,
        },
    });

    try terminal_.?.draw(child);
    try drawTitle(&menu.menuWindow.window);
}

fn drawTitle(win: *const vaxis.Window) !void {
    const text = getTitle();
    const title_seg = vaxis.Cell.Segment{
        .text = text,
        .style = .{},
    };
    var title_segs = [_]vaxis.Cell.Segment{title_seg};
    const width = win.*.width;
    const height = win.*.height;
    const len: i17 = @intCast(text.len / 2);
    const x_off: i17 = @as(i17, (win.*.width / 2)) - len;
    const y_off = 1;
    const child = win.*.child(.{
        .width = width,
        .height = height,
        .x_off = x_off,
        .y_off = y_off,
    });
    _ = child.print(title_segs[0..], .{ .wrap = .word });
}

fn getTitle() []const u8 {
    return if (terminal_exited)
        "FINISHED! Press <ENTER> to close this window"
    else
        "Press <CTRL+ENTER> to cancel this script";
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
