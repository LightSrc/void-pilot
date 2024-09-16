const std = @import("std");
const vaxis = @import("vaxis");
const memoryModule = @import("../memory.zig");
const terminalModule = @import("../terminal.zig");
const MenuState = @import("../enums/menuState.zig").MenuState;
const SelectMenu = @import("../models/selectMenu.zig").SelectMenu;
const InstallMenu = @import("../models/installMenu.zig").InstallMenu;
const MenuList = @import("../models/menuList.zig").MenuList;
const menuCollection = @import("../menuCollection.zig").menuCollection;
const selected_bg = @import("../style.zig").selected_bg;
const active_bg = @import("../style.zig").active_bg;

pub const MenuWindow = struct {
    window: vaxis.Window,
};

pub var activeMenu: MenuState = .mainMenu;
pub var menuWindow: MenuWindow = undefined;
pub var menuTable: vaxis.widgets.Table.TableContext = .{
    .active_bg = active_bg,
    .selected_bg = selected_bg,
    .row_bg_1 = .{ .index = 234 },
    .row_bg_2 = .{ .index = 233 },
    .header_names = .{ .custom = &.{"Select Action"} },
};

var titles_ = std.ArrayList(SelectMenu).init(memoryModule.alloc);
var lastActiveMenu_: ?MenuState = null;
var lastActiveMenuIdx_: u64 = 0;

pub fn init(win: *const vaxis.Window) MenuWindow {
    return .{
        .window = win.initChild(
            0,
            win.height / 6,
            .{ .limit = win.width },
            .{ .limit = win.height - (win.height / 6 + 1) },
        ),
    };
}

pub fn setActiveMenu(state: MenuState) !void {
    activeMenu = state;
    menuTable.active = true;
    menuTable.row = 0;

    titles_.clearAndFree();

    for (menuCollection) |menu| {
        if (menu.state == state) {
            for (menu.items) |iMenu| {
                const suffix: []const u8 = if (iMenu.flatpak_script != null and iMenu.xbps_script == null) " (flatpak)" else "";
                const slices = [_][]const u8{ iMenu.title, suffix };
                const newTitle = try std.mem.concat(memoryModule.alloc, u8, &slices);
                try titles_.append(.{ .title = newTitle });
            }
        }
    }
}

pub fn drawMenu(win: *const vaxis.Window) !void {
    menuWindow = init(&win.*);
    try vaxis.widgets.Table.drawTable(
        memoryModule.event_alloc,
        menuWindow.window,
        titles_,
        &menuTable,
    );
}

pub fn isMenuActive() bool {
    return menuTable.active;
}

pub fn onSelectAction() !void {
    const id: u64 = menuTable.row;
    if (lastActiveMenu_ != null) {
        if (id == 0) try selectedXbps();
        if (id == 1) try selectedFlatpak();
        return;
    }

    var ss: InstallMenu = undefined;
    var index: u64 = 0;
    var found: bool = false;
    for (menuCollection) |item| {
        if (item.state == activeMenu) {
            for (item.items) |sub_item| {
                if (index == id) {
                    ss = sub_item;
                    found = true;
                    break;
                }
                index += 1;
            }
        }
        if (found == true) break;
    }

    if (found == true) {
        if (ss.xbps_script != null and ss.flatpak_script != null) {
            lastActiveMenu_ = activeMenu;
            lastActiveMenuIdx_ = menuTable.row;
            try setActiveMenu(.xbpsOrFlatpak);
            return;
        }
        if (ss.xbps_script) |package| {
            try terminalModule.initialize(package);
            return;
        }
        if (ss.flatpak_script) |flatpak| {
            try terminalModule.initialize(flatpak);
            return;
        }
        if (ss.child) |child| {
            const newMenu: ?MenuList = findMenu(child);
            if (newMenu != null) {
                try setActiveMenu(newMenu.?.state);
            }
        }
    }
}

pub fn goBack() !void {
    if (lastActiveMenu_) |lastMenu| {
        try setActiveMenu(lastMenu);
        menuTable.row = lastActiveMenuIdx_;
        lastActiveMenu_ = null;
        return;
    }

    const currentMenu_ = findMenu(activeMenu);
    if (currentMenu_) |currentMenu| {
        if (currentMenu.parent) |parentMenu| {
            try setActiveMenu(parentMenu);
        }
    }
}

pub fn goUp() void {
    menuTable.row -|= 1;
}

pub fn goDown() void {
    menuTable.row +|= 1;
}

fn findMenu(state: MenuState) ?MenuList {
    var foundMenu: ?MenuList = null;
    for (menuCollection) |item| {
        if (state == item.state) {
            foundMenu = item;
            break;
        }
    }

    return foundMenu;
}

fn getInstallScript(flatpak: bool) ?[]const []const u8 {
    var menu: ?InstallMenu = null;
    var index: u64 = 0;
    var found: bool = false;
    for (menuCollection) |item| {
        if (item.state == lastActiveMenu_) {
            for (item.items) |sub_item| {
                if (index == lastActiveMenuIdx_) {
                    menu = sub_item;
                    found = true;
                    break;
                }
                index += 1;
            }
        }
        if (found == true) break;
    }

    if (menu) |iMenu| {
        if (flatpak) {
            return iMenu.flatpak_script;
        } else {
            return iMenu.xbps_script;
        }
    }

    return null;
}

fn selectedXbps() !void {
    const script = getInstallScript(false);
    if (script) |script_path| {
        try terminalModule.initialize(script_path);
        try goBack();
    }
}

fn selectedFlatpak() !void {
    const script = getInstallScript(true);
    if (script) |script_path| {
        try terminalModule.initialize(script_path);
        try goBack();
    }
}
