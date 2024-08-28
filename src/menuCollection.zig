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
            .{
                .title = "Install Window Managers",
                .child = null,
                .xbps_script = null,
                .flatpak_script = null,
            },
            .{
                .title = "Install Developer Tools",
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
                .title = "Install Audio & Video",
                .child = null,
                .xbps_script = null,
                .flatpak_script = null,
            },
            .{
                .title = "Install Browsers",
                .child = .browsersMenu,
                .xbps_script = null,
                .flatpak_script = null,
            },
            .{
                .title = "Install Messaging Clients",
                .child = null,
                .xbps_script = null,
                .flatpak_script = null,
            },
            .{
                .title = "Install Terminals",
                .child = null,
                .xbps_script = null,
                .flatpak_script = null,
            },
            .{
                .title = "Install Game Launchers",
                .child = null,
                .xbps_script = null,
                .flatpak_script = null,
            },
            .{
                .title = "Install Code Editors & IDEs",
                .child = null,
                .xbps_script = null,
                .flatpak_script = null,
            },
        },
        .state = .appMenu,
        .parent = .mainMenu,
    },
    .{
        .items = &[_]InstallMenu{
            .{
                .title = "Install Brave",
                .child = null,
                .xbps_script = null,
                .flatpak_script = null,
            },
            .{
                .title = "Install Chromium",
                .child = null,
                .xbps_script = null,
                .flatpak_script = null,
            },
            .{
                .title = "Install Ungoogled Chromium",
                .child = null,
                .xbps_script = null,
                .flatpak_script = null,
            },
            .{
                .title = "Install Firefox",
                .child = null,
                .xbps_script = &[_][]const u8{"./scripts/apps/firefox_xbps.sh"},
                .flatpak_script = &[_][]const u8{"./scripts/apps/firefox_flatpak.sh"},
            },
            .{
                .title = "Install Floorp",
                .child = null,
                .xbps_script = null,
                .flatpak_script = null,
            },
            .{
                .title = "Install Librewolf",
                .child = null,
                .xbps_script = null,
                .flatpak_script = null,
            },
            .{
                .title = "Install Opera",
                .child = null,
                .xbps_script = null,
                .flatpak_script = null,
            },
            .{
                .title = "Install Thorium",
                .child = null,
                .xbps_script = null,
                .flatpak_script = null,
            },
            .{
                .title = "Install Vivaldi",
                .child = null,
                .xbps_script = null,
                .flatpak_script = null,
            },
            .{
                .title = "Install Zen",
                .child = null,
                .xbps_script = null,
                .flatpak_script = null,
            },
        },
        .state = .browsersMenu,
        .parent = .appMenu,
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
