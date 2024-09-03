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
                .child = .messagingMenu,
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
                .xbps_script = &[_][]const u8{"./scripts/apps/browsers/brave_xbps.sh"},
                .flatpak_script = &[_][]const u8{"./scripts/apps/browsers/brave_flatpak.sh"},
            },
            .{
                .title = "Install Chromium",
                .child = null,
                .xbps_script = &[_][]const u8{"./scripts/apps/browsers/chromium_xbps.sh"},
                .flatpak_script = &[_][]const u8{"./scripts/apps/browsers/chromium_flatpak.sh"},
            },
            .{
                .title = "Install Ungoogled Chromium",
                .child = null,
                .xbps_script = &[_][]const u8{"./scripts/apps/browsers/ungoogled_chromium_xbps.sh"},
                .flatpak_script = &[_][]const u8{"./scripts/apps/browsers/ungoogled_chromium_flatpak.sh"},
            },
            .{
                .title = "Install Firefox",
                .child = null,
                .xbps_script = &[_][]const u8{"./scripts/apps/browsers/firefox_xbps.sh"},
                .flatpak_script = &[_][]const u8{"./scripts/apps/browsers/firefox_flatpak.sh"},
            },
            .{
                .title = "Install Floorp",
                .child = null,
                .xbps_script = &[_][]const u8{"./scripts/apps/browsers/floorp_xbps.sh"},
                .flatpak_script = &[_][]const u8{"./scripts/apps/browsers/floorp_flatpak.sh"},
            },
            .{
                .title = "Install Librewolf",
                .child = null,
                .xbps_script = &[_][]const u8{"./scripts/apps/browsers/librewolf_xbps.sh"},
                .flatpak_script = &[_][]const u8{"./scripts/apps/browsers/librewolf_flatpak.sh"},
            },
            .{
                .title = "Install Opera",
                .child = null,
                .xbps_script = &[_][]const u8{"./scripts/apps/browsers/opera_xbps.sh"},
                .flatpak_script = &[_][]const u8{"./scripts/apps/browsers/opera_flatpak.sh"},
            },
            .{
                .title = "Install Thorium",
                .child = null,
                .xbps_script = &[_][]const u8{"./scripts/apps/browsers/thorium_xbps.sh"},
                .flatpak_script = null,
            },
            .{
                .title = "Install Vivaldi",
                .child = null,
                .xbps_script = &[_][]const u8{"./scripts/apps/browsers/vivaldi_xbps.sh"},
                .flatpak_script = &[_][]const u8{"./scripts/apps/browsers/vivaldi_flatpak.sh"},
            },
            .{
                .title = "Install Zen",
                .child = null,
                .xbps_script = null,
                .flatpak_script = &[_][]const u8{"./scripts/apps/browsers/zen_flatpak.sh"},
            },
        },
        .state = .browsersMenu,
        .parent = .appMenu,
    },
    .{
        .items = &[_]InstallMenu{
            .{
                .title = "Install Discord",
                .child = null,
                .xbps_script = &[_][]const u8{"./scripts/apps/messaging/discord_xbps.sh"},
                .flatpak_script = &[_][]const u8{"./scripts/apps/messaging/discord_flatpak.sh"},
            },
            .{
                .title = "Install Slack",
                .child = null,
                .xbps_script = null,
                .flatpak_script = &[_][]const u8{"./scripts/apps/messaging/slack_flatpak.sh"},
            },
            .{
                .title = "Install Telegram Desktop",
                .child = null,
                .xbps_script = &[_][]const u8{"./scripts/apps/messaging/telegram_xbps.sh"},
                .flatpak_script = &[_][]const u8{"./scripts/apps/messaging/telegram_flatpak.sh"},
            },
        },
        .state = .messagingMenu,
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
