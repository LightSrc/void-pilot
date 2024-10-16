const std = @import("std");
const vaxis = @import("vaxis");
const menuModule = @import("menu.zig");

pub fn drawKeybindings(win: *const vaxis.Window) !void {
    if (menuModule.isMenuActive() == false) return;
    const next_seg = vaxis.Cell.Segment{
        .text = "Arrow Up/K = Up",
        .style = .{ .bg = .{ .index = 0 } },
    };
    const prev_seg = vaxis.Cell.Segment{
        .text = "   Arrow Down/J = Down",
        .style = .{ .bg = .{ .index = 0 } },
    };
    const select_seg = vaxis.Cell.Segment{
        .text = "   Enter = Select",
        .style = .{ .bg = .{ .index = 0 } },
    };
    const back_seg = vaxis.Cell.Segment{
        .text = "   Backspace = Back",
        .style = .{ .bg = .{ .index = 0 } },
    };
    var bindings_segs = [_]vaxis.Cell.Segment{ next_seg, prev_seg, select_seg, back_seg };

    var segs_text_len: usize = 0;
    for (bindings_segs) |seg| {
        segs_text_len += seg.text.len;
    }
    const width = .{ .limit = win.*.width };
    const height = .{ .limit = win.*.height / 2 };
    const x_off = 0;
    const y_off = win.*.height - 1;

    const child = win.*.child(.{
        .width = width,
        .height = height,
        .x_off = x_off,
        .y_off = y_off,
    });
    const center_window = vaxis.widgets.alignment.center(
        child,
        segs_text_len,
        child.height,
    );
    _ = center_window.print(bindings_segs[0..], .{ .wrap = .none });
}
