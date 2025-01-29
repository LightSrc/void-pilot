# Void Pilot - Post Install Utility

![Preview](/.github/preview.png)

## Overview
**Void Pilot** is designed to offer a seamless and user-friendly experience for installing packages, programs, and drivers on your system. Ever wished you could set up your desktop environment and other programs without diving into lengthy wikis? Now you can! With our automated scripts, all the heavy lifting is done for you, making installation a breeze.

## How To Install & Run
Run this command in your terminal. This script will install void-pilot in your $HOME folder
```bash
curl -fSL https://github.com/LightSrc/void-pilot/releases/latest/download/install.sh | sh
```
If you want to run void-pilot again
> [!NOTE]
> after first installation you need to close terminal to make this command work
```bash
void-pilot
```
OR
```bash
$HOME/void-pilot/void-pilot
```

## How To Update
Simply copy/paste this command in your terminal and script will do everything for you.
```bash
curl -fSL https://github.com/LightSrc/void-pilot/releases/latest/download/install.sh | sh
```

## Goals
Primary objective is to create the best possible post-install utility that simplifies package installation without any unnecessary complexity. Additionally, Void Pilot will enable users to install packages not available in the main Void repository, such as Discord or browsers like Brave and Thorium (some of them are accessible via Flatpak).

## Status
The project is currently in development, with no estimated time of arrival (ETA) announced yet. I appreciate your patience and understanding as I work towards making Void Pilot ready for use.

## Technical Details

* **Programming Language**: The project is written in Zig.
* **User Interface**: We utilize libvaxis for a terminal-based user interface (TUI).
* **Why Scripts Are Not Built In Binary?**
    + When building the project, you'll receive both a binary and scripts as output.
    + Scripts are not included in the binary to ensure users have control over them if any issues arise during installation.
