Snowflake-dots❄️ 
===============

My flake-based NixOS configuration featuring Hyprland and flakes

## Big thanks to 
* [Misterio77's nix-starter-configs](https://github.com/Misterio77/nix-starter-configs "nix-starter-configs")
* [misterio's dotfiles](https://git.sr.ht/~misterio/nix-config "dots")
* [D3Ext's aesthetic wallpaper repo](https://github.com/D3Ext/aesthetic-wallpapers "walls")
* [NixOS Manual](https://nixos.org/manual/nixos/unstable/ "nix")
* [Erase your darlings](https://grahamc.com/blog/erase-your-darlings/ "persist")

# Overview
These are my personal NixOS dotfiles, written completely in nix.
This repo is a _'semi fork'_ of an older repo [Nix-Dots](https://github.com/Daru-san/Nix-Dots "Nix-Dots") that aims to improve on everything it did and go way further with a new structure.
With these I aim to manage _everything_ decleratively from the system configuration down to every single script and make the total folder size as small as possible while making these configs as extensive possible. They're still in early development but as of now are pretty usable for anyone who's brave enough to dabble in constant error checking and scanning files for syntax errors. I won't stop you though!

## My environment 
* Desktop: Hyprland(unstable)
* Browser: Firefox nightly
* Shell: zsh using oh-my-zsh and oh-my-posh
* Editor: Neovim nighly using Lazy.vim
* Kernel: lqx-latest

 <details>
  <summary>Hyprland</summary>
    <ul>
        <li>Bar: waybar</li>
        <li>Launcher: fuzzel</li>
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
        <li>Files: ranger/nautilus</li>
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

<details>
   <Summary>Program specific guides</summary>
      <h3>Neovim</h3>
      <p>
        My Neovim config uses a user activation script which clones my personal configs from my repo 'Daru-san/NeoLaze' if there isn't any ~/.config/nvim folder, if you don't want them just make sure the 'nvim' folder exists and it won't clone the repo
      </p>
 </details>

## Screenshots
![Preview 1](https://github.com/Daru-san/Snowflake-dots/blob/master/assets/prev1.png)
![Preview 2](https://github.com/Daru-san/Snowflake-dots/blob/master/assets/prev2.png)
![Preview 3](https://github.com/Daru-san/Snowflake-dots/blob/master/assets/prev3.png)
![Preview 4](https://github.com/Daru-san/Snowflake-dots/blob/master/assets/prev4.png)
![Preview 5](https://github.com/Daru-san/Snowflake-dots/blob/master/assets/prev5.png)

## Structure:
```
├── home-manager
│   └── Modules
│       ├── Desktop
│       │   ├── Hyprland
│       │   ├── Wallpapers
│       │   └── Wayfire
│       ├── Programs
│       │   ├── Browser
│       │   ├── cli
│       │   ├── Games
│       │   ├── Images
│       │   ├── Music
│       │   └── Video
│       ├── Settings
│       │   ├── Audio
│       │   ├── Development
│       │   ├── Directories
│       │   ├── Editor
│       │   └── Shell
│       └── Sync
│           ├── ssh
│           └── Syncthing
├── flake.lock
├── flake.nix
├── modules
│   ├── home-manager
│   └── nixos
├── nixos
│   └── Modules
├── overlays
└── pkgs
```
## Note on persistence
My implementation of persistence is still very incomplete and there are still a few issues that need to be ironed out, namely issues with passwd and very high memory usage on nixos-rebuild, so I wouldn't recommend using that for the time being. Also you should probably set it up yourself and copy your hardware-configuration.nix and replace mine, here's a good starting point: [Erase your darlings](https://grahamc.com/blog/erase-your-darlings/ "persist").

## Installation _for those brave ones_
Note: Prepare for plenty of errors
Also note: My configurations are very catered to intel systems with integrated graphics so you might have to edit boot.nix, hardware.nix and Performance.nix

Cloning the repo
```bash
    #Clone the repo   
    git clone github.com/Daru-san/Snowflake-dots ~/snowflake 
    cd ~/snowflake/ 
```

Copying your hardware configuration
```bash
    #Copy your hardware configuration.nix 
    cd nixos
    mv hardware-configuration.nix hc.nix
    cp /etc/nixos/hardware-configuration.nix hardware-configuration.nix 
```

Important: ensuring compatibility
```bash
    #Make necessary changes to these files to ensure it build for your specific system
    cd Modules
    vi boot.nix
    vi hardware.nix
    vi performance.nix
```
Building the system
```bash
    #Build the configuration
    cd ~/snowflake
    sudo nixos-rebuild {switch/boot} --flake .#AspireNix #Replace with hostname if you changed it
```
## Monthly TODO: November

### Todo:
- [ ] Implement multi-device configs
- [ ] Set up shell environments for developing in different languages
- [ ] Set up custom packages
- [ ] Add full installation instructions

### In Progress:
- [ ] Document everything
- [ ] Fix persistence issues
- [ ] Convert all non-nix configs to nix
    - [x] ranger
    - [ ] neofetch

### Completed
- [x] Finish flake
- [x] Build system
- [x] Set up persistence and disk encryption
- [x] Revamp Neovim configs
