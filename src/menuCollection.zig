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
                .child = .driversMenu,
                .xbps_script = null,
                .flatpak_script = null,
            },
            .{
                .title = "Install Desktop Environments",
                .child = .desktopEnvsMenu,
                .xbps_script = null,
                .flatpak_script = null,
            },
            .{
                .title = "Install Window Managers",
                .child = .windowManagersMenu,
                .xbps_script = null,
                .flatpak_script = null,
            },
            .{
                .title = "Install Developer Tools",
                .child = .developerToolsMenu,
                .xbps_script = null,
                .flatpak_script = null,
            },
            .{
                .title = "Gaming",
                .child = .gamingMenu,
                .xbps_script = null,
                .flatpak_script = null,
            },
            .{
                .title = "Kernel",
                .child = .kernelMenu,
                .xbps_script = null,
                .flatpak_script = null,
            },
            .{
                .title = "Clean System",
                .child = .cleanMenu,
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
                .title = "Install Graphical Design Apps",
                .child = .graphicalAppsMenu,
                .xbps_script = null,
                .flatpak_script = null,
            },
            .{
                .title = "Install File Sharing Apps",
                .child = .fileSharingMenu,
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
                .title = "Install Office Apps",
                .child = .officeMenu,
                .xbps_script = null,
                .flatpak_script = null,
            },
            .{
                .title = "Install Code Editors & IDEs",
                .child = .codeEditorsMenu,
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
                .title = "Install Code - OSS",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "vscode" },
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "com.visualstudio.code-oss" },
            },
            .{
                .title = "Install Doom Emacs",
                .child = null,
                .xbps_script = &[_][]const u8{"./scripts/apps/code/doom_emacs.sh"},
                .flatpak_script = null,
            },
            .{
                .title = "Install Emacs",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "emacs" },
                .flatpak_script = null,
            },
            .{
                .title = "Install LazyVim",
                .child = null,
                .xbps_script = &[_][]const u8{"./scripts/apps/code/lazyvim.sh"},
                .flatpak_script = null,
            },
            .{
                .title = "Install Sublime Text 3",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "sublime-text3" },
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "com.sublimetext.three" },
            },
            .{
                .title = "Install Vim",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "vim" },
                .flatpak_script = null,
            },
            .{
                .title = "Install Visual Studio Code",
                .child = null,
                .xbps_script = null,
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "com.visualstudio.code" },
            },
            .{
                .title = "Install Zed",
                .child = null,
                .xbps_script = &[_][]const u8{"./scripts/apps/code/zed.sh"},
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "dev.zed.Zed" },
            },
        },
        .state = .codeEditorsMenu,
        .parent = .appMenu,
    },
    .{
        .items = &[_]InstallMenu{
            .{
                .title = "Install GNOME",
                .child = null,
                .xbps_script = &[_][]const u8{"./scripts/desktopEnvs/gnome.sh"},
                .flatpak_script = null,
            },
            .{
                .title = "Install KDE",
                .child = null,
                .xbps_script = &[_][]const u8{"./scripts/desktopEnvs/kde.sh"},
                .flatpak_script = null,
            },
        },
        .state = .desktopEnvsMenu,
        .parent = .mainMenu,
    },
    .{
        .items = &[_]InstallMenu{
            .{
                .title = "Install Hyprland",
                .child = null,
                .xbps_script = &[_][]const u8{"./scripts/windowManagers/hyprland.sh"},
                .flatpak_script = null,
            },
        },
        .state = .windowManagersMenu,
        .parent = .mainMenu,
    },
    .{
        .items = &[_]InstallMenu{
            .{
                .title = "Install AMD GPU Driver",
                .child = null,
                .xbps_script = &[_][]const u8{"./scripts/drivers/amd_video.sh"},
                .flatpak_script = null,
            },
            .{
                .title = "Install Intel GPU Driver",
                .child = null,
                .xbps_script = &[_][]const u8{"./scripts/drivers/intel_video.sh"},
                .flatpak_script = null,
            },
            .{
                .title = "Install Nvidia (Series 800+) GPU Driver",
                .child = null,
                .xbps_script = &[_][]const u8{"./scripts/drivers/nvidia_video.sh"},
                .flatpak_script = null,
            },
            .{
                .title = "Install Nvidia (Series 600/700) GPU Driver",
                .child = null,
                .xbps_script = &[_][]const u8{"./scripts/drivers/nvidia470_video.sh"},
                .flatpak_script = null,
            },
            .{
                .title = "Install Nvidia (Series 400/500) GPU Driver",
                .child = null,
                .xbps_script = &[_][]const u8{"./scripts/drivers/nvidia390_video.sh"},
                .flatpak_script = null,
            },
        },
        .state = .driversMenu,
        .parent = .mainMenu,
    },
    .{
        .items = &[_]InstallMenu{
            .{
                .title = "Install Linux Kernel 6.13",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "linux6.13" },
                .flatpak_script = null,
            },
            .{
                .title = "Install Linux Kernel 6.12",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "linux6.12" },
                .flatpak_script = null,
            },
            .{
                .title = "Install Linux Kernel 6.6",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "linux6.6" },
                .flatpak_script = null,
            },
            .{
                .title = "Install Linux Kernel 6.1",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "linux6.1" },
                .flatpak_script = null,
            },
            .{
                .title = "Compile And Install Tkg Gaming Kernel (For Advanced Users)",
                .child = null,
                .xbps_script = &[_][]const u8{"./scripts/install-tkg-kernel.sh"},
                .flatpak_script = null,
            },
        },
        .state = .kernelMenu,
        .parent = .mainMenu,
    },
    .{
        .items = &[_]InstallMenu{
            .{
                .title = "Install IDEs",
                .child = .codeEditorsMenu,
                .xbps_script = null,
                .flatpak_script = null,
            },
            .{
                .title = "Install Virtual Machine Managers",
                .child = .vmsMenu,
                .xbps_script = null,
                .flatpak_script = null,
            },
            .{
                .title = "Install Programming Languages",
                .child = .programmingLangMenu,
                .xbps_script = null,
                .flatpak_script = null,
            },
            .{
                .title = "Install DB Tools",
                .child = .dbToolsMenu,
                .xbps_script = null,
                .flatpak_script = null,
            },
            .{
                .title = "Install Docker",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/developerTools/docker.sh" },
                .flatpak_script = null,
            },
            .{
                .title = "Install Whaler",
                .child = null,
                .xbps_script = null,
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "com.github.sdv43.whaler" },
            },
            .{
                .title = "Install Postman",
                .child = null,
                .xbps_script = null,
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "com.getpostman.Postman" },
            },

        },
        .state = .developerToolsMenu,
        .parent = .mainMenu,
    },
    .{
        .items = &[_]InstallMenu{
            .{
                .title = "Install Gamescope",
                .child = null,
                .xbps_script = &[_][]const u8{"./scripts/xbps/xbps.sh", "gamescope"},
                .flatpak_script = null,
            },
            .{
                .title = "Install Gamemode",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "gamemode" },
                .flatpak_script = null,
            },
            .{
                .title = "Install Game Launchers",
                .child = .gameLaunchersMenu,
                .xbps_script = null,
                .flatpak_script = null,
            },
            .{
                .title = "Install MangoHud",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "MangoHud" },
                .flatpak_script = null,
            },
        },
        .state = .gamingMenu,
        .parent = .mainMenu,
    },
    .{
        .items = &[_]InstallMenu{
            .{
                .title = "LibreOffice (All apps)",
                .child = null,
                .xbps_script = &[_][]const u8{"./scripts/xbps/xbps.sh", "libreoffice"},
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "org.libreoffice.LibreOffice" },
            },
            .{
                .title = "LibreOffice Calc",
                .child = null,
                .xbps_script = &[_][]const u8{"./scripts/xbps/xbps.sh", "libreoffice-calc"},
                .flatpak_script = null,
            },
            .{
                .title = "LibreOffice Draw",
                .child = null,
                .xbps_script = &[_][]const u8{"./scripts/xbps/xbps.sh", "libreoffice-draw"},
                .flatpak_script = null,
            },
            .{
                .title = "LibreOffice Impress",
                .child = null,
                .xbps_script = &[_][]const u8{"./scripts/xbps/xbps.sh", "libreoffice-impress"},
                .flatpak_script = null,
            },
            .{
                .title = "LibreOffice Math",
                .child = null,
                .xbps_script = &[_][]const u8{"./scripts/xbps/xbps.sh", "libreoffice-math"},
                .flatpak_script = null,
            },
            .{
                .title = "LibreOffice Writer",
                .child = null,
                .xbps_script = &[_][]const u8{"./scripts/xbps/xbps.sh", "libreoffice-writer"},
                .flatpak_script = null,
            },
        },
        .state = .officeMenu,
        .parent = .appMenu,
    },
    .{
        .items = &[_]InstallMenu{
            .{
                .title = "Install Virt-Manager",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "virt-manager", "qemu", "libvirtd" },
                .flatpak_script = null,
            },
            .{
                .title = "Install Gnome Boxes",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "gnome-boxes", "qemu", "libvirtd" },
                .flatpak_script = null,
            },
            .{
                .title = "Install VirtualBox",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "virtualbox-ose" },
                .flatpak_script = null,
            },
        },
        .state = .vmsMenu,
        .parent = .developerToolsMenu,
    },
    .{
        .items = &[_]InstallMenu{
            .{
                .title = "Install Blender",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "blender" },
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "org.blender.Blender" },
            },
            .{
                .title = "Install GIMP",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "gimp" },
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "org.gimp.GIMP" },
            },
            .{
                .title = "Install Krita",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "krita" },
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "org.kde.krita" },
            },
            .{
                .title = "Install Inkscape",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "inkscape" },
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "org.inkscape.Inkscape" },
            },
        },
        .state = .graphicalAppsMenu,
        .parent = .appMenu,
    },
    .{
        .items = &[_]InstallMenu{
            .{
                .title = "Install qBittorrent",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "qbittorrent" },
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "org.qbittorrent.qBittorrent" },
            },
            .{
                .title = "Install Transmission",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "transmission" },
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "com.transmissionbt.Transmission" },
            },
            .{
                .title = "Install Nextcloud Desktop",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "nextcloud-client" },
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "com.nextcloud.desktopclient.nextcloud" },
            },
        },
        .state = .fileSharingMenu,
        .parent = .appMenu,
    },
    .{
        .items = &[_]InstallMenu{
            .{
                .title = "Install DBeaver",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "dbeaver" },
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "io.dbeaver.DBeaverCommunity" },
            },
            .{
                .title = "Install SQLite Browser",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "sqlitebrowser" },
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "org.sqlitebrowser.sqlitebrowser" },
            },
            .{
                .title = "Install RedisInsight",
                .child = null,
                .xbps_script = null,
                .flatpak_script = &[_][]const u8{ "./scripts/flatpak/flathub-install.sh", "com.redis.RedisInsight" },
            },
        },
        .state = .dbToolsMenu,
        .parent = .developerToolsMenu,
    },
    .{
        .items = &[_]InstallMenu{
            .{
                .title = "Install .NET SDK",
                .child = null,
                .xbps_script = &[_][]const u8{"./scripts/developerTools/dotnet-sdk.sh"},
                .flatpak_script = null,
            },
            .{
                .title = "Install Go",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "go" },
                .flatpak_script = null,
            },
            .{
                .title = "Install NodeJS (via NVM)",
                .child = null,
                .xbps_script = &[_][]const u8{"./scripts/developerTools/nvm.sh"},
                .flatpak_script = null,
            },
            .{
                .title = "Install Python (v2)",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "python" },
                .flatpak_script = null,
            },
            .{
                .title = "Install Python3",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "python3" },
                .flatpak_script = null,
            },
            .{
                .title = "Install Ruby",
                .child = null,
                .xbps_script = &[_][]const u8{ "./scripts/xbps/xbps.sh", "ruby" },
                .flatpak_script = null,
            },
            .{
                .title = "Install Rust",
                .child = null,
                .xbps_script = &[_][]const u8{"./scripts/developerTools/rust.sh"},
                .flatpak_script = null,
            },
            .{
                .title = "Install Zig",
                .child = null,
                .xbps_script = &[_][]const u8{"./scripts/developerTools/zig.sh"},
                .flatpak_script = null,
            },
        },
        .state = .programmingLangMenu,
        .parent = .developerToolsMenu,
    },
    .{
        .items = &[_]InstallMenu{
            .{
                .title = "Purge Old Kernels",
                .child = null,
                .xbps_script = &[_][]const u8{"./scripts/purge-kernels.sh"},
                .flatpak_script = null,
            },
            .{
                .title = "Delete Cached Packages",
                .child = null,
                .xbps_script = &[_][]const u8{"./scripts/remove-cached-packages.sh"},
                .flatpak_script = null,
            },
.{
                .title = "Delete Orphan Packages",
                .child = null,
                .xbps_script = &[_][]const u8{"./scripts/remove-orphan-packages.sh"},
                .flatpak_script = null,
            },
        },
        .state = .cleanMenu,
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
