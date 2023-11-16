# SnowflakeOS
My flake-based NixOS configuration featuring Hyprland, Sway and many more

<p align="center"><img src="https://i.imgur.com/X5zKxvp.png" width=300px></p>

## Overview
These are my personal NixOS dotfiles, written completely in nix.
This repo is a _'semi fork'_ of an older repo ![Nix-Dots](https://github.com/Daru-san/Nix-Dots) that aims to improve on everything it did and go way further with a new structure.
With these I aim to manage _everything_ decleratively from the system configuration down to every single script. They're still in early development but as of now are pretty usable for anyone who's brave enough to dabble in constant error checking and scanning files for syntax errors. I won't stop you though!

## My environment 
* Desktop: Hyprland(unstable)
* Browser: Firefox nightly
* Shell: zsh
* Editor: Neovim nighly using NvChad
* Kernel: lqx-latest

### Hyprland
* Bar: waybar
* Launcher: fuzzel
* Terminal: kitty
* Monitor management: kanshi
* Media control: playerctl
* Idle and lock: swaylock and swayidle
* Volume control: swayosd
* Clipboard: copyq
* Wallpapers: wpaperd/swww

### Others
* Audio effects: easyeffects
* File manager(s): nautilus/ranger
* Music: Spotify(Spicetify)
* Minecraft: Prism-Launcher(cracked)
* Video player: mpv with scripts
* System monitoring: Btop and Nvtop
* IO Scheduler: System76-scheduler
* Miscellaneous:
    - sysz: systemd module manager
    - swaync: notifications
    - freetube: youtube client
    - pqiv: image viewer
    - glow: markdown editor 
    - ani-cli: anime streamer and downloader


## Screenshots
On the way!


## TODO:

### Todo:
- [ ] Implement multi-device configs
- [ ] Set up shell environments for developing in different languages
- [ ] Create a deploy script
- [ ] Set up custom packages
- [ ] Completely overhaul rofi configuration

### In Progress:
- [ ] Set up persistence and encryption
    - [x] Set up default xdg directories for home
    - [ ] Set up system persistence module 
    - [ ] Set up home persistence module
    - [ ] Set up disk encryption

### Completed
- [x] Finish flake
- [x] Build system
