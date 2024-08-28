# Void Pilot - Post Install Utility

## Overview
Void Pilot aims to provide an intuitive and hassle-free experience when installing packages, programs, or drivers on your system. This post-install utility is designed to be a one-stop for all your installation needs.

## Usage
TODO

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
