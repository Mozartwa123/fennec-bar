# Fennec-bar

![image](./test.png)

For polish users - polish version of readme is in README_PL.md.

## About the project

Fennec-bar is a taskbar written from scratch in qt and quickshell framework. It is created for hyprexin, hipotetical desktop based of hyprland compositor - for linexin - young linux distribution, created by Linexy - polish youtuber. I have an ambition to contribute to make hyprexin real, creating own hyprland dots (configuration files), although my programming skills are rather bad

## Why not waybar

If only I knew how quickshell is time consuming (almost a week), surely I had used waybar for implementing fennec-bar. But the linux youtuber's propaganda (for example "do not use this, use that, because that is trendy") convinced me to go into quickshell, although the documentation is not very precise. On the other hand, quickshell has more possibilities for example pop-ups, animations and more options in programming logic, and more functions, I propablY do not know about



## Features

What I implemented in one week? To be honest not much, but there are all features:

- Applet with date

- Power button - after clicking you have possibilities of suspending ("Uśpij"), logging out ("Wyloguj"), rebooting ("Restart") and shutdowning off ("Wyłącz"), sorry for only polish names of those buttons - I'll fix it, but on this moment you can change it in Power.qml file.

- Volume applet - after clicking, you can regulate volume using slider

- System tray - left click opens app, which icon is on applet, middle button - secondary button, right click - opens menu. Attention! Have in mind, there are bugs, see dedicated [section](#bugs)

- Start menu - need rofi for working, because clicking menu launch it. Rofi will be replaced with Quickshell logic, due to lack of touching support.

- Workspaces switching buttons - clicking it move you to given workspace. Keep in mint it uses Hyprland Quickshell api, so it does not work on other WMs.

- Animations - icon soaring after touching with mouse, pretty jelly beans animations of pop-ups appearing

## Bugs

There are some glitches on hyprland launching tray menu. On this moment there are no specific implementation of menu's logic, besides Quickshell display function. There are no similar problems with sound, and power popup, because I implemented it myself. I'll do the same with tray, because on this moment tray menu and pop-ups behaviour and look are not consistent.

ON this moment there is no notification system, because the tray was implemented on system with KDE Plasma (of course it way linexin), which has own notification system. I would implement and test potential notification system on distro with no other DEs.



## To do

- Configuration files in json, or js (javascript) in order to set colors, etc.

- Transplations - qt has own system QsTr, but it is not very easy to manage. I'd prefer  json file with all translations, updated with CLi Python script (because it is convienient to json edition, java script is propably the worst language to cli).

- Adding other applets - notifications, ram, cpu usage, customization menu, driver manager, etc.

- Removing rofi

- Patching hyprland to better adaption to touch. I think hyprland has potential for it - mapping keybindings to buttons and touchscreen gestures. It is only an ambition on this moment, because my knowledge about wayland is none.

- Adding possibility to add custom splashes to hyprland. On this moment there is no possibility to do that without patching source code (splashes are in c++ header file). Why would I like to do that? Because sense of humour of those splashes are really specyfic to hyprland developer, so other people could not get its sens. It is better to see jokes you understand - it can motivate you to boring work. Like heigher point it is not a goal for this moment.

- Tutorial to using hyprland with those dots. It can convince other people, adapted to windows/macos/mouse using layout to tiling window managers.

- Emergency waybar configuration in case of instability of quickshell which is very young project

- Creating tar.gz package for distributing it on arch-based systems

If you would like to help (it is better to write for me to prevent wasted work), write me on mozartwa123@gmail.com or in github pages - your nick will be write next to task. If you feel not capable of doing it after declaring doing some things, write me again (do not feel embarressed) I will remove your nick. In case of any help your nick will appear in contributor list:)

## Instalation or what put where

I created a dedicated script **setup.sh**. It is not tested yet (in a few days this status can changed) - it is simple - installing dependencies (requires sudo): quickshell, ttf-meslo-nerd (for icons in fennec-bar) and stow (to creating symlinks), change ownership (requires sudo, propably unnecessary), moves repository to proper directories, backups old configurations, and create symling with ~/.config and repo (moved to ~/.fennec-bar). Thanks to symlinks the config updates could be done updating repository with command:

`    git pull`

In directory ~/.fennec-bar. In the same directory you can launch script with command:

`chown +x setup.sh && ./setup.sh`

Unfortunately this script requires arch based linux system, like linexin. Setuping it on debian is really hard, due to lack of quickshell in debian (even in debian sid) repos, and lots of dependencies of quichshell you need to compile.

### Links, or what I used

Fennec's wallpaper and icon in start menu are created by [linexin's](https://github.com/Petexy) creator.

Linexin: [GitHub - Petexy/Linexin: Arch-based distro for my usage](https://github.com/Petexy/Linexin)

[Quickshell](https://quickshell.org/) and [Hyprland](https://hypr.land/)


