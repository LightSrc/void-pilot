const MenuState = @import("../enums/menuState.zig").MenuState;

pub const InstallMenu = struct {
    title: []const u8,
    child: ?MenuState,
    xbps_script: ?[]const []const u8,
    flatpak_script: ?[]const []const u8,
};
