const std = @import("std");
const vaxis = @import("vaxis");

const memoryModule = @import("memory.zig");
const terminalModule = @import("terminal.zig");
const keysHandler = @import("keysHandler.zig");
const header = @import("panels/header.zig");
const menu = @import("panels/menu.zig");

pub var vx: vaxis.Vaxis = undefined;

pub fn main() !void {
    memoryModule.init();

    var tty = try vaxis.Tty.init();
    defer tty.deinit();

    vx = try vaxis.init(memoryModule.alloc, .{});
    vx.sgr = .legacy;
    defer vx.deinit(memoryModule.alloc, tty.anyWriter());
    var loop: vaxis.Loop(union(enum) {
        key_press: vaxis.Key,
        winsize: vaxis.Winsize,
    }) = .{ .tty = &tty, .vaxis = &vx };

    try loop.start();
    defer loop.stop();
    try vx.enterAltScreen(tty.anyWriter());
    try vx.queryTerminal(tty.anyWriter(), 1 * std.time.ns_per_s);
    try menu.setActiveMenu(.mainMenu);
    while (true) {
        std.time.sleep(8 * std.time.ns_per_ms);
        try terminalModule.refresh();
        while (loop.tryEvent()) |event| {
            switch (event) {
                .key_press => |key| {
                    try keysHandler.onKey(key);
                    // Close the Program
                    if (key.matches('c', .{ .ctrl = true })) return;
                    try terminalModule.update(.{ .key_press = key });
                },
                .winsize => |ws| try vx.resize(memoryModule.alloc, tty.anyWriter(), ws),
            }
        }

        const win = vx.window();
        win.clear();

        header.drawHeader(&win);
        try menu.drawMenu(&win);
        try terminalModule.draw();

        try vx.render(tty.anyWriter());
    }
}
