const std = @import("std");
const vaxis = @import("vaxis");

const menu = @import("panels/menu.zig");

pub fn onKey(key: vaxis.Key) !void {
    if (menu.menuTable.active == false) return;
    if (key.matchesAny(&.{ vaxis.Key.up, 'k' }, .{})) menu.goUp();
    if (key.matchesAny(&.{ vaxis.Key.down, 'j' }, .{})) menu.goDown();

    if (key.matchExact(vaxis.Key.backspace, .{})) {
        try menu.goBack();
    }

    if (key.matchExact(vaxis.Key.enter, .{})) {
        try menu.onSelectAction();
    }
}
