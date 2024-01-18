❄️Snowflake-dots❄️ 
===============
My beautiful, functional, focused NixOS Hyprland and Sway configurations, written completely in Nix, with desktop switching
<p align="center">
 <img src="https://github.com/Daru-san/Snowflake-dots/assets/135046711/ca25eab0-08da-4bbd-b336-21c43fdc4bab">
</p>

<p align="center">
  <img src="https://img.shields.io/static/v1?label=Nix Flake&message=Check&style=flat&logo=nixos&colorA=24273A&colorB=7EBAE4&logoColor=CAD3F5">
  <img src="https://img.shields.io/static/v1?label=Nixpkgs&message=Unstable&style=flat&logo=nixos&colorA=24273A&colorB=9173ff&logoColor=CAD3F5">
</p>

<p align="center">
  <img src="https://img.shields.io/static/v1?label=Desktop&message=Hyprland&style=flat&logo=hyprland&colorA=24273A&colorB=5ACBCC&logoColor=CAD3F5">
  <img src="https://img.shields.io/static/v1?label=Desktop&message=Sway&style=flat&logo=Sway&colorA=24273A&colorB=5ACBCC&logoColor=CAD3F5">
</p>

 ## Environment
* Compositor: [Hyprland](https://github.com/hyprwm/Hyprland "hyprland")/[Swayfx](https://github.com/willpower3309/swayfx)
* Launcher: [anyrun](https://github.com/Kirottu/anyrun "anyrun")
* bar: [waybar](https://github.com/Alexays/Waybar "waybar")
* Browser: [Firefox nightly](https://github.com/nix-community/flake-firefox-nightly "ff nightly")
* Shell: [zsh](http://zsh.sourceforge.net/ "zsh") using [oh-my-zsh](https://ohmyz.sh/ "omz")
* Editor: [Neovim nightly](https://github.com/nix-community/neovim-nightly-overlay "nvn") using my [custom Neovim configuration](https://github.com/Daru-san/LazyVi)
* Kernel: [Linux-zen](https://archlinux.org/packages/extra/x86_64/linux-zen/ "zen")

# Previews
## Hyprland
<p float="left">
  <img src="https://i.ibb.co/gT4h7qp/2024-01-17-203149-hyprshot.png" width="100%" />
  <img src="https://i.ibb.co/tb1H75m/2024-01-17-205440-hyprshot.png" width="100%" />
  <img src="https://i.ibb.co/20910r8/2024-01-17-205556-hyprshot.png" width="100%" />
  <img src="https://i.ibb.co/f00vfSF/2024-01-17-205959-hyprshot.png" width="100%" />
</p>

## Sway (Swayfx)
<p>
<img src = "https://i.ibb.co/b3xysYr/prev1.png">
<img src="https://i.ibb.co/5xFrLnz/prev5.png">
</p>

## How to switch desktops
In configuration.nix
```nix
# Enable hyprland or sway in configuration.nix, enable one at a time, not both, since that messes some things
{
  wayland = {
    enable = true;
    sway = {
      enable = false; # Change this to true to enable sway
      swayfx.enable = false; # To enable swayfx, enable sway first
    };
    hyprland.enable = true; # Enable hyprland
  };
}
```

In home.nix
```nix
# Enable hyprland or sway, it will not work if you enable both at once, unlike in configuration.nix, I will consider adding more compositors in the future
{
  wayland.compositor = "hyprland"; # Here you can put hyprland or sway
}
```

# Other
## Structure
```
.
├── home
│   └── daru
│       ├── programs
│       ├── themes
│       └── wayland
├── install
├── modules
│   ├── home-manager
│   │   ├── audio
│   │   ├── btop
│   │   ├── connect
│   │   ├── games
│   │   ├── git
│   │   ├── mpv
│   │   ├── neovim
│   │   ├── ranger
│   │   ├── shell
│   │   ├── themes
│   │   ├── tmux
│   │   ├── translate-shell
│   │   ├── wayland
│   │   └── xdg
│   └── nixos
│       ├── android
│       ├── audio
│       ├── fonts
│       ├── neovim
│       ├── shell
│       ├── ssh
│       ├── system
│       └── wayland
├── overlays
├── pkgs
└── systems
    └── AspireLaptop
```

## Install
I use my own custom nixos iso to install NixOS on my systems, [Snow-Installer](https://www.github.com/Daru-san/Snow-Installer). It has plenty of useful tools and has sway as a desktop for graphical installs. 

Installation
```bash
# Boot into the installer
# Connect to wifi, instructions on the wiki, link in the helpful links section. 
# My installer has network manager so I use that instead of wpa utility

# Enter root shell
sudo -i

# Create you partitions, I personally use cfdisk, but you can use any tool e.g parted
cfdisk

# Format your partitions
mkfs.ext4 -L root /dev/root-partition # your partition name here

# It isn't necessary to separate home and root but I do it anyway
mkfs.ext4 -L home /dev/home-partition

# I primarily use swap partitions instead of swap files, set up one like this
mkswap -L swap /dev/swap-partition # replace with your partition
swapon /dev/by-label/swap

# Mount your partitions
mount /dev/by-label/root /mnt
mount --mkdir /dev/boot-partition /mnt/boot
mount --mkdir /dev/by-label/home /mnt/home

nixos-generate-config --root /mnt

# Edit the configuration
cd /mnt/etc/nixos
vi configuration.nix

# Check the partitions to make sure their mount points are correct
# Also check for swap if you're using a partition
vi hardware-configuration.nix

# Once you're done, install the system configuration
nixos-install
```

Deploy my config
```bash
# Clone the github repo
git clone https://github.com/Daru-san/Snowflake-dots

# You should probably make your own system configurations for compatibility 
# Feel free to edit any files in the repo to suit your needs, otherwise

cd Snowflake-dots/systems/AspireLaptop

# Copy your partitions to the hardware-configuration.nix file
vi hardware-configuration.nix

# Build the system configuration
sudo nixos-rebuild switch --flake .#system e.g .#AspireLaptop

# Then build the home configuration

# If you haven't installed it yet
nix-shell -p home-manager

# Then switch the config
home-manager switch --flake .#daru@AspireLaptop
```

Once you're done set your wallpaper using waypaper
```bash
waypaper
# and use this to restore your set wallpaper, it will be run whenever hyprland starts
waypaper --restore
```

## Helpful links
* [Misterio77's nix-starter-configs](https://github.com/Misterio77/nix-starter-configs "nix-starter-configs")
* [misterio's dotfiles](https://git.sr.ht/~misterio/nix-config "dots")
* [NixOS Manual](https://nixos.org/manual/nixos/unstable/ "nix")
* [Erase your darlings](https://grahamc.com/blog/erase-your-darlings/ "persist")
* [NixOS wiki](https://nixos.wiki "nix-wiki")
* [MyNixOS](https://mynixos.com "Best nix resource")
* [NixOS install guide](https://nixos.wiki/wiki/NixOS_Installation_Guide)
## Thanks to
* [justinlime's waybar configuration](https://github.com/justinlime/dotfiles)
* [D3Ext's aesthetic wallpaper repo](https://github.com/D3Ext/aesthetic-wallpapers "walls")

<!---
TODO:
* Update Minecraft config
* Learn javascript and configure ags, replace waybar
--->
