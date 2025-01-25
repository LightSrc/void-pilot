const vaxis = @import("vaxis");
const menu = @import("panels/menu.zig");

pub const selected_bg: vaxis.Cell.Color = .{ .index = 231 };
pub const active_bg: vaxis.Cell.Color = .{ .index = 23 };
pub const other_bg: vaxis.Cell.Color = .{ .index = 233 };
pub const row_bg_1: vaxis.Cell.Color = .{ .index = 234 };
pub const row_bg_2: vaxis.Cell.Color = .{ .index = 233 };

pub fn changeThemeColorsToRgb() void {
    menu.menuTable = vaxis.widgets.Table.TableContext{
        .active_bg = .{ .rgb = .{ 255, 0, 0 } },
        .selected_bg = .{ .rgb = .{ 255, 255, 255 } },
        .row_bg_1 = menu.menuTable.row_bg_1,
        .row_bg_2 = menu.menuTable.row_bg_2,
        .header_names = menu.menuTable.header_names,
    };
}
