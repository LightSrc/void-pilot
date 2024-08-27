const InstallMenu = @import("installMenu.zig").InstallMenu;
const MenuState = @import("../enums/menuState.zig").MenuState;

pub const MenuList = struct {
    items: []const InstallMenu,
    state: MenuState,
    parent: ?MenuState,
};
