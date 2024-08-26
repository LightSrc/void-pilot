const std = @import("std");
const vaxis = @import("vaxis");

const memoryModule = @import("memory.zig");
const header = @import("panels/header.zig");

pub var vx: vaxis.Vaxis = undefined;

pub fn main() !void {
    memoryModule.init();

    var tty = try vaxis.Tty.init();
    defer tty.deinit();

    vx = try vaxis.init(memoryModule.alloc, .{});
    defer vx.deinit(memoryModule.alloc, tty.anyWriter());
    var loop: vaxis.Loop(union(enum) {
        key_press: vaxis.Key,
        winsize: vaxis.Winsize,
    }) = .{ .tty = &tty, .vaxis = &vx };

    try loop.start();
    defer loop.stop();
    try vx.enterAltScreen(tty.anyWriter());
    try vx.queryTerminal(tty.anyWriter(), 1 * std.time.ns_per_s);

    while (true) {
        std.time.sleep(8 * std.time.ns_per_ms);
        while (loop.tryEvent()) |event| {
            switch (event) {
                .key_press => |key| {
                    // Close the Program
                    if (key.matches('c', .{ .ctrl = true })) return;
                },
                .winsize => |ws| try vx.resize(memoryModule.alloc, tty.anyWriter(), ws),
            }
        }

        const win = vx.window();
        win.clear();

        header.drawHeader(&win);

        try vx.render(tty.anyWriter());
    }
}
