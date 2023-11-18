# Snowflake-dots❄️ 
My flake-based NixOS configuration featuring Hyprland, Sway and many more

## Big thanks to 
* [Misterio77's nix-starter-configs](https://github.com/Misterio77/nix-starter-configs "nix-starter-configs")
* [misterio's dotfiles](https://git.sr.ht/~misterio/nix-config "dots")
* [D3Ext's aesthetic wallpaper repo](https://github.com/D3Ext/aesthetic-wallpapers "walls")
* [NixOS Manual](https://nixos.org/manual/nixos/unstable/ "nix")
* [Erase your darlings](https://grahamc.com/blog/erase-your-darlings/ "persist")

# Overview
These are my personal NixOS dotfiles, written completely in nix.
This repo is a _'semi fork'_ of an older repo [Nix-Dots](https://github.com/Daru-san/Nix-Dots "Nix-Dots") that aims to improve on everything it did and go way further with a new structure.
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

## Note on persistence
When using persistence it's a good idea to make sure to persist /etc /home /var and /tmp. You should also persist /etc/passwd and /etc/shadow do prevent password issues.Make sure both /tmp and /var/tmp are persisted, if not your configurations will be built in memory which will slow down your system while running 'nixos-rebuild'. 

## TODO:

### Todo:
- [ ] Implement multi-device configs
- [ ] Set up shell environments for developing in different languages
- [ ] Set up custom packages
- [ ] Add full installation instructions

### In Progress:
- [ ] Fix rofi
- [ ] Document everything

### Completed
- [x] Finish flake
- [x] Build system
- [x] Set up persistence and disk encryption
