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
                .title = "Install Archivers",
                .child = .archiversMenu,
                .xbps_script = null,
                .flatpak_script = null,
            },
            .{
                .title = "Install Audio & Video",
                .child = .audioVideoMenu,
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
                .child = .terminalsMenu,
                .xbps_script = null,
                .flatpak_script = null,
            },
            .{
                .title = "Install Game Launchers",
                .child = .gameLaunchersMenu,
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
                .title = "Install Ark",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "ark" },
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "org.kde.ark" },
            },
            .{
                .title = "Install File Roller",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "file-roller" },
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "org.gnome.FileRoller" },
            },
            .{
                .title = "Install PeaZip",
                .child = null,
                .xbps_script = null,
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "io.github.peazip.PeaZip" },
            },
            .{
                .title = "Install 7Zip",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "7zip" },
                .flatpak_script = null,
            },
        },
        .state = .archiversMenu,
        .parent = .appMenu,
    },
    .{
        .items = &[_]InstallMenu{
            .{
                .title = "Install Brave",
                .child = null,
                .xbps_script = &[_][]const u8{"./scripts/apps/browsers/brave_xbps.sh"},
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "com.brave.Browser" },
            },
            .{
                .title = "Install Chromium",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "chromium" },
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "org.chromium.Chromium" },
            },
            .{
                .title = "Install Ungoogled Chromium",
                .child = null,
                .xbps_script = &[_][]const u8{"./scripts/apps/browsers/ungoogled_chromium_xbps.sh"},
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "io.github.ungoogled_software.ungoogled_chromium" },
            },
            .{
                .title = "Install Firefox",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "firefox" },
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "org.mozilla.firefox" },
            },
            .{
                .title = "Install Floorp",
                .child = null,
                .xbps_script = null,
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "one.ablaze.floorp" },
            },
            .{
                .title = "Install Librewolf",
                .child = null,
                .xbps_script = &[_][]const u8{"./scripts/apps/browsers/librewolf_xbps.sh"},
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "io.gitlab.librewolf-community" },
            },
            .{
                .title = "Install Opera",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "opera" },
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "com.opera.Opera" },
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
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "vivaldi" },
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "com.vivaldi.Vivaldi" },
            },
            .{
                .title = "Install Zen",
                .child = null,
                .xbps_script = null,
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "io.github.zen_browser.zen" },
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
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "com.discordapp.Discord" },
            },
            .{
                .title = "Install Signal Desktop",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "Signal-Desktop" },
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "org.signal.Signal" },
            },
            .{
                .title = "Install Skype",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "skype" },
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "com.skype.Client" },
            },
            .{
                .title = "Install Slack",
                .child = null,
                .xbps_script = null,
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "com.slack.Slack" },
            },
            .{
                .title = "Install Telegram Desktop",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "telegram-desktop" },
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "org.telegram.desktop" },
            },
        },
        .state = .messagingMenu,
        .parent = .appMenu,
    },
    .{
        .items = &[_]InstallMenu{
            .{
                .title = "Install Audacity",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "audacity" },
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "org.audacityteam.Audacity" },
            },
            .{
                .title = "Install Kdenlive",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "audacity" },
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "org.kde.kdenlive" },
            },
            .{
                .title = "Install Spotify",
                .child = null,
                .xbps_script = null,
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "com.spotify.Client" },
            },
            .{
                .title = "Install OBS Studio",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "obs" },
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "com.obsproject.Studio" },
            },
            .{
                .title = "Install VLC",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "vlc" },
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "org.videolan.VLC" },
            },
        },
        .state = .audioVideoMenu,
        .parent = .appMenu,
    },
    .{
        .items = &[_]InstallMenu{
            .{
                .title = "Install Alacritty",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "alacritty" },
                .flatpak_script = null,
            },
            .{
                .title = "Install Gnome Terminal",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "gnome-terminal" },
                .flatpak_script = null,
            },
            .{
                .title = "Install Kitty",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "kitty" },
                .flatpak_script = null,
            },
            .{
                .title = "Install Konsole",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "konsole" },
                .flatpak_script = null,
            },
            .{
                .title = "Install Simple Terminal (st)",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "st" },
                .flatpak_script = null,
            },
            .{
                .title = "Install Yakuake",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "yakuake" },
                .flatpak_script = null,
            },
            .{
                .title = "Install Xterm",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "xterm" },
                .flatpak_script = null,
            },
        },
        .state = .terminalsMenu,
        .parent = .appMenu,
    },
    .{
        .items = &[_]InstallMenu{
            .{
                .title = "Install Bottles",
                .child = null,
                .xbps_script = null,
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "com.usebottles.bottles" },
            },
            .{
                .title = "Install Heroic Games Launcher",
                .child = null,
                .xbps_script = null,
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "com.heroicgameslauncher.hgl" },
            },
            .{
                .title = "Install Lutris",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "lutris" },
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "net.lutris.Lutris" },
            },
            .{
                .title = "Install Steam",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "steam" },
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "com.valvesoftware.Steam" },
            },
        },
        .state = .gameLaunchersMenu,
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
