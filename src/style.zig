const vaxis = @import("vaxis");
const menu = @import("panels/menu.zig");

pub const selected_bg: vaxis.Cell.Color = .{ .index = 15 };
pub const active_bg: vaxis.Cell.Color = .{ .index = 2 };
pub const other_bg: vaxis.Cell.Color = .{ .index = 0 };
pub const row_bg_1: vaxis.Cell.Color = .{ .index = 0 };
pub const row_bg_2: vaxis.Cell.Color = .{ .index = 8 };

pub fn changeThemeColorsToRgb() void {
    menu.menuTable = vaxis.widgets.Table.TableContext{
        .active_bg = .{ .rgb = .{ 41, 83, 64 } },
        .selected_bg = .{ .rgb = .{ 255, 255, 255 } },
        .row_bg_1 = .{ .rgb = .{ 28, 28, 28 } },
        .row_bg_2 = .{ .rgb = .{ 18, 18, 18 } },
        .header_names = menu.menuTable.header_names,
    };
}
