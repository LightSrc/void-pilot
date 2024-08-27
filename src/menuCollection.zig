const std = @import("std");
const memoryModule = @import("memory.zig");
const MenuList = @import("models/menuList.zig").MenuList;
const InstallMenu = @import("models/installMenu.zig").InstallMenu;
const SelectMenu = @import("models/selectMenu.zig").SelectMenu;

pub const menuCollection = [_]MenuList{
    .{
        .items = &[_]InstallMenu{
            .{
                .title = "Update System Packages",
                .child = null,
                .xbps_script = &[_][]const u8{"./scripts/update.sh"},
                .flatpak_script = null,
            },
            .{
                .title = "Install Applications",
                .child = .appMenu,
                .xbps_script = null,
                .flatpak_script = null,
            },
            .{
                .title = "Install Drivers",
                .child = null,
                .xbps_script = null,
                .flatpak_script = null,
            },
            .{
                .title = "Install Desktop Environments",
                .child = null,
                .xbps_script = null,
                .flatpak_script = null,
            },
        },
        .state = .mainMenu,
        .parent = null,
    },
    .{
        .items = &[_]InstallMenu{
            .{
                .title = "Install Thorium Browser",
                .child = null,
                .xbps_script = null,
                .flatpak_script = null,
            },
            .{
                .title = "Install Firefox Browser",
                .child = null,
                .xbps_script = &[_][]const u8{"./scripts/apps/firefox_xbps.sh"},
                .flatpak_script = &[_][]const u8{"./scripts/apps/firefox_flatpak.sh"},
            },
        },
        .state = .appMenu,
        .parent = .mainMenu,
    },
    .{
        .items = &[_]InstallMenu{
            .{
                .title = "Install As Package (XBPS)",
                .child = null,
                .xbps_script = null,
                .flatpak_script = null,
            },
            .{
                .title = "Install As Flatpak",
                .child = null,
                .xbps_script = null,
                .flatpak_script = null,
            },
        },
        .state = .xbpsOrFlatpak,
        .parent = null,
    },
};
