const std = @import("std");
const vaxis = @import("vaxis");
const other_bg = @import("../style.zig").other_bg;

const logo =
    \\:::  === :::====  ::: :::====       :::====  ::: :::      :::====  :::====
    \\:::  === :::  === ::: :::  ===      :::  === ::: :::      :::  === :::====
    \\===  === ===  === === ===  ===      =======  === ===      ===  ===   ===
    \\ ======  ===  === === ===  ===      ===      === ===      ===  ===   ===
    \\   ==     ======  === =======       ===      === ========  ======    ===
    \\
    \\
;
const title_logo = vaxis.Cell.Segment{
    .text = logo,
    .style = .{},
};
const title_info = vaxis.Cell.Segment{
    .text = "Easily install/uninstall packages and manage your void distro \n",
    .style = .{},
};
const title_disclaimer = vaxis.Cell.Segment{
    .text = "This program could encounter unexpected errors. Use at your own risk. \n",
    .style = .{},
};
var title_segs = [_]vaxis.Cell.Segment{ title_logo, title_info, title_disclaimer };

pub fn drawHeader(win: *const vaxis.Window) void {
    const top_bar = win.initChild(
        0,
        0,
        .{ .limit = win.width },
        .{ .limit = win.height / 6 },
    );
    for (title_segs[0..]) |*title_seg| {
        title_seg.*.style.bg = other_bg;
    }
    top_bar.fill(.{ .style = .{
        .bg = other_bg,
    } });
    const logo_bar = vaxis.widgets.alignment.center(
        top_bar,
        90,
        top_bar.height - (top_bar.height / 3),
    );
    _ = try logo_bar.print(title_segs[0..], .{ .wrap = .word });
}
