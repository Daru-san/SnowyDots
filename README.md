Snowflake-dots❄️ 
===============

My flake-based NixOS configuration featuring Hyprland and flakes

## Big thanks to
* [Misterio77's nix-starter-configs](https://github.com/Misterio77/nix-starter-configs "nix-starter-configs")
* [misterio's dotfiles](https://git.sr.ht/~misterio/nix-config "dots")
* [D3Ext's aesthetic wallpaper repo](https://github.com/D3Ext/aesthetic-wallpapers "walls")
* [NixOS Manual](https://nixos.org/manual/nixos/unstable/ "nix")
* [Erase your darlings](https://grahamc.com/blog/erase-your-darlings/ "persist")
* [NixOS wiki](https://nixos.wiki "nix-wiki")
* [MyNixOS](https://mynixos.com "Best nix resource")
* [justinlime's waybar configuration](https://github.com/justinlime/dotfiles)
---

# Overview
My personal NixOS dotfiles written completely in Nix.

## Environment 
* Desktop: Hyprland
* Browser: Firefox nightly
* Shell: zsh using oh-my-zsh and oh-my-posh
* Editor: Neovim nightly using Lazy.vim
* Kernel: lqx-latest

 <details>
  <summary>Hyprland</summary>
    <ul>
        <li>Bar: waybar</li>
        <li>Launcher: anyrun</li>
        <li>Terminal: kitty</li>
        <li>Monitor management: kanshi</li>
        <li>Media control: playerctl</li>
        <li>Idle: swayidle</li>
        <li>Lockscreen: swaylock</li>
        <li>Volume & brighness control: swayosd</li>
        <li>Clipboard: copyq/wl-clipboard</li>
        <li>Wallpapers: wpaperd</li>
    </ul>
</details>

 <details>
  <summary>Others</summary>
    <ul>
        <li>Audio effects: easyeffects</li>
        <li>Files: ranger/dolphin</li>
        <li>Music: Spotify with spicetify</li>
        <li>Minecraft: Prism-Launcher - <i>cracked</i></li>
        <li>Video: mpv with scripts</li>
        <li>Monitoring: Btop/Nvtop</li>
        <li>IO Scheduler: none/system76</li>
        <li>Systemd control: sysz</li>
        <li>Youtube: freetube</li>
        <li>Images: pqiv</li>
        <li>Markdown editing: glow</li>
        <li>Anime stream/download: ani-cli</li>
    </ul>
</details>

## Screenshots
![Preview 1](https://github.com/Daru-san/Snowflake-dots/blob/master/assets/prev1.png)
![Preview 2](https://github.com/Daru-san/Snowflake-dots/blob/master/assets/prev2.png)
![Preview 3](https://github.com/Daru-san/Snowflake-dots/blob/master/assets/prev3.png)
![Preview 4](https://github.com/Daru-san/Snowflake-dots/blob/master/assets/prev4.png)

---

## Configuration Structure:
```
.
├── home
│   └── daru
│       └── Modules
├── modules
│   ├── home-manager
│   └── nixos
├── nixos-configs
│   └── AspireLaptop
│       └── Modules
├── overlays
├── pkgs
├── flake.nix
└── flake.lock
```
## Installation
Note: This may not work for every use case and I'd rather you copied individual config files than built the whole thing, since there are *many* device specific configurations here.

Cloning the repo
```bash
    #Clone the repo   
    git clone github.com/Daru-san/Snowflake-dots ~/snowflake 
    cd ~/snowflake/ 
```
Building the system
```bash
    #Build the configuration
    cd ~/snowflake
    sudo nixos-rebuild {switch/boot} --flake .#AspireNix #Laptop configuration 
    home-manager switch --flake .#daru@AspireNix #my user(daru) found in /home/daru
```
---

## December TODO list:

### Todo:
- [x] Change theme
- [ ] Set up shell environments for developing in different languages
- [ ] Redo installation instructions
- [ ] Document everything
- [x] Make modules for everything
  - [x] Make device specifc modules e.g intel-gpu for intel iGpus
- [x] Fix config inconsistensies
- [ ] Fix persistence issues
- [ ] Set up ags
