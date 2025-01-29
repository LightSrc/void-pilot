const std = @import("std");
const vaxis = @import("vaxis");
const other_bg = @import("../style.zig").other_bg;

const logo =
    \\===  ===  ======  === =======       =======  === ===       ======  =========
    \\===  === ===  === === ===  ===      ===  === === ===      ===  === =========
    \\===  === ===  === === ===  ===      =======  === ===      ===  ===    ===
    \\ ======  ===  === === ===  ===      ===      === ===      ===  ===    ===
    \\   ==     ======  === =======       ===      === ========  ======     ===
    \\
    \\
;
const title_logo = vaxis.Cell.Segment{
    .text = logo,
    .style = .{},
};
const title_info = vaxis.Cell.Segment{
    .text = "Easily install packages and manage your Void Linux distro \n",
    .style = .{},
};
const title_disclaimer = vaxis.Cell.Segment{
    .text = "This program could encounter unexpected errors. Use at your own risk. \n",
    .style = .{},
};
var title_segs = [_]vaxis.Cell.Segment{ title_logo, title_info, title_disclaimer };

pub fn drawHeader(win: *const vaxis.Window) void {
    const width = win.*.width;
    const height = 14;
    const x_off = 0;
    const y_off = 0;
    const top_bar = win.child(.{
        .width = width,
        .height = height,
        .x_off = x_off,
        .y_off = y_off,
    });
    // for (title_segs[0..]) |*title_seg| {
    //     title_seg.*.style.bg = other_bg;
    // }
    //top_bar.fill(.{ .style = .{ .bg = other_bg } });
    const logo_bar = vaxis.widgets.alignment.center(
        top_bar,
        77,
        top_bar.height - (top_bar.height / 3),
    );
    _ = logo_bar.print(title_segs[0..], .{ .wrap = .word });
}
